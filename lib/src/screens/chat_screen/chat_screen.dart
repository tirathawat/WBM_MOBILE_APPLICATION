import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/models/chat_user.dart';
import 'package:WBM_platform/src/screens/chat_screen/components/chat_user_list.dart';
import 'package:WBM_platform/src/services/chat_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
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
            StreamBuilder<List<ChatUser>>(
                stream: ChatFireStore.getUsers(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return Text('Something Went Wrong Try later');
                      } else {
                        var _chatUsers = snapshot.data;
                        return ListView.builder(
                          itemCount: _chatUsers.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 16),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ChatUsersList(
                              name: _chatUsers[index].name,
                              lastMessage: _chatUsers[index].lastMessage,
                              image: _chatUsers[index].image,
                              time: _chatUsers[index]
                                  .lastMessageTime
                                  .toIso8601String(),
                              isMessageRead: (index == 0 || index == 3)
                                  ? true
                                  : false, //TODO
                            );
                          },
                        );
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
