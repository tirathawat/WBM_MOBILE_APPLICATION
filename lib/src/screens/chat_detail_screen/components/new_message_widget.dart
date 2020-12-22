import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/services/chat_firestore.dart';
import 'package:flutter/material.dart';

class NewMessageWidget extends StatefulWidget {
  final String name;
  NewMessageWidget({Key key, this.name}) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
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
                      receiver: widget.name, message: _sendMessageController.text);
                _sendMessageController.clear();
              },
              iconSize: 25.0,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

  void sendMessage({String receiver, String message}) async {
    FocusScope.of(context).unfocus();
    await ChatFireStore.uploadMessage(receiver, message);
  }
}
