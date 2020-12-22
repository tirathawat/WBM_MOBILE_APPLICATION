import 'package:WBM_platform/src/models/message.dart';
import 'package:WBM_platform/src/screens/chat_detail_screen/components/message_widget.dart';
import 'package:WBM_platform/src/services/chat_firestore.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  final String name;

  const MessagesWidget({
    @required this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        stream: ChatFireStore.getMessages(name),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;

                return messages.isEmpty
                    ? buildText('Say Hi..')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];

                          return MessageWidget(
                            name: name,
                            message: message,
                            isMe: message.name == name,
                          );
                        },
                      );
              }
          }
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}