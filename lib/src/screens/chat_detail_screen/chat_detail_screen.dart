import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/models/chat_message.dart';
import 'package:WBM_platform/src/screens/chat_detail_screen/components/chat_bubble.dart';
import 'package:WBM_platform/src/screens/chat_detail_screen/components/chat_detail_screen_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  static String routeName = "/chat_detail";

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _sendMessageController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ChatDetailScreenAppBar(interlocutor: name),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: ListView.builder(
                itemCount: 0,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return /*ChatBubble(
                    chatMessage: provider.chats[index],
                  )*/Container();
                },
              ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16, bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () {},
                    iconSize: 25.0,
                    color: kPrimaryColor,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _sendMessageController,
                      decoration: InputDecoration.collapsed(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          gapPadding: 10,
                        ),
                        hintText: "Send a message...",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_sendMessageController.text != "")
                        sendMessage(
                            receiver: name,
                            message: _sendMessageController.text);
                      _sendMessageController.clear();
                    },
                    iconSize: 25.0,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage({String receiver, String message}) {
    var databaseReference =
        FirebaseDatabase.instance.reference().child("Chats");
    databaseReference.push().set(ChatMessage(
            message: message,
            sender: FirebaseAuth.instance.currentUser.uid,
            receiver: receiver)
        .toJson());
  }
}
