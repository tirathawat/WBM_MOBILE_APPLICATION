import 'package:WBM_platform/src/config/utils.dart';


class UserField {
  static final String lastMessageTime = "time";
  static final String lastMessage = "lastMessage";
}

class ChatUser {
  final String name;
  final String lastMessage;
  final String image;
  final DateTime lastMessageTime;

  ChatUser({this.name, this.lastMessage, this.image, this.lastMessageTime});

  static ChatUser fromJson(Map<String, dynamic> json) => ChatUser(
    name: json["name"],
    lastMessage: json["lastMessage"],
    image: json["image"],
    lastMessageTime: Utils.toDateTime(json["time"]),
  );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastMessage": lastMessage,
        "image": image,
        "time": lastMessageTime,
      };
}
