import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/models/chat_user.dart';
import 'package:WBM_platform/src/screens/chat_screen/components/chat_user_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 /* List<ChatUser> _chatUsers = [
    ChatUser(
      name: "Doctor",
      lastMessage: "Awesome Setup",
      image: "assets/images/doctor.png",
      time: DateTime.now(),
    ),
    ChatUser(
      name: "Physiotherapist",
      lastMessage: "That's Great",
      image: "assets/images/physiotherapist.png",
      time: DateTime.now(),
    ),
  ];*/

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return /*SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Text(
                "Chats",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
              itemCount: _chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUsersList(
                  name: _chatUsers[index].name,
                  lastMessage: _chatUsers[index].lastMessage,
                  image: _chatUsers[index].image,
                  time: _chatUsers[index].time.toIso8601String(),
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    )*/Container();
  }
}
