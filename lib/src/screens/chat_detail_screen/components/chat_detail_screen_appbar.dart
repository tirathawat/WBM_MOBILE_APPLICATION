import 'package:flutter/material.dart';

class ChatDetailScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  ChatDetailScreenAppBar({this.interlocutor});

  final String interlocutor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundImage: interlocutor == "Doctor"
                    ? AssetImage("assets/images/doctor.png")
                    : AssetImage("assets/images/physiotherapist.png"),
                maxRadius: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  interlocutor,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
