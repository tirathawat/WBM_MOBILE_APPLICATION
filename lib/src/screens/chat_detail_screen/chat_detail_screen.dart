import 'package:WBM_platform/src/screens/chat_detail_screen/components/messages_widget.dart';
import 'package:WBM_platform/src/screens/chat_detail_screen/components/new_message_widget.dart';
import 'package:WBM_platform/src/screens/chat_detail_screen/components/chat_detail_screen_appbar.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  static String routeName = "/chat_detail";

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ChatDetailScreenAppBar(interlocutor: name),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: MessagesWidget(name: name),
            ),
          ),
          NewMessageWidget(name: name),
        ],
      ),
    );
  }
}
