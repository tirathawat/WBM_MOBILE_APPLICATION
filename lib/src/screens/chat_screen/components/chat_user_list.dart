import 'package:WBM_platform/src/screens/chat_detail_screen/chat_detail_screen.dart';
import 'package:flutter/material.dart';

class ChatUsersList extends StatefulWidget{
  final String name;
  final String lastMessage;
  final String image;
  final String time;
  final bool isMessageRead;
  ChatUsersList({@required this.name,@required this.lastMessage,@required this.image,@required this.time,@required this.isMessageRead});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();

}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ChatDetailScreen.routeName, arguments: widget.name);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name),
                          SizedBox(height: 6,),
                          Text(widget.lastMessage,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,color: widget.isMessageRead?Colors.pink:Colors.grey.shade500),),
          ],
        ),
      ),
    );
  }
}