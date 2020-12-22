import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/screens/chat_screen/chat_screen.dart';
import 'package:WBM_platform/src/screens/home_screen/components/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  final List<Widget> _pageOption = [
    Body(),
    ChatScreen(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: kPrimaryColor,
        height: 70,
        buttonBackgroundColor: Colors.grey[800],
        animationDuration: kAnimationDuration * 2,
        backgroundColor: Colors.transparent,
        items: [
          Icon(
            Icons.info,
            color: Colors.white,
          ),
          Icon(
            Icons.chat,
            color: Colors.white,
          ),
          Icon(
            Icons.directions_walk_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
  }
}
