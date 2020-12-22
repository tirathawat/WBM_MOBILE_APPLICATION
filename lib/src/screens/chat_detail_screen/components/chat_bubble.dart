import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/models/chat_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

final user = FirebaseAuth.instance.currentUser;

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.sender != user.uid
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.sender != user.uid
                ? Colors.grey[700]
                : kPrimaryColor),
          ),
          padding: EdgeInsets.all(16),
          child: Text(widget.chatMessage.message, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
