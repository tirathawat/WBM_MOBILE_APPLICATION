import 'package:WBM_platform/src/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:WBM_platform/src/models/message.dart';
import 'package:WBM_platform/src/config/utils.dart';

class ChatFireStore {
  static Stream<List<ChatUser>> getUsers() {
    return FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(ChatUser.fromJson));
  }

  static Future uploadMessage(String name, String message) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$name/messages');

    final newMessage = Message(
      name: name,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('users');
    try {
      await refUsers.doc(name).update({
        UserField.lastMessageTime: DateTime.now(),
        UserField.lastMessage: message
      });
    } on Exception catch (e) {
      print(e);
      final userDoc = refUsers.doc(name);
      final newUser = ChatUser(
          name: name,
          lastMessage: message,
          image: name == "Doctor"
              ? "assets/images/doctor.png"
              : name == "Physiotherapist"
                  ? "assets/images/physiotherapist.png"
                  : null,
          lastMessageTime: DateTime.now());
      await userDoc.set(newUser.toJson());
    }
  }

  static Stream<List<Message>> getMessages(String name) =>
      FirebaseFirestore.instance
          .collection('chats/$name/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));
}
