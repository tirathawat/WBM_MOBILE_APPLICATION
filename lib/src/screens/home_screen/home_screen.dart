import 'package:WBM_platform/src/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}