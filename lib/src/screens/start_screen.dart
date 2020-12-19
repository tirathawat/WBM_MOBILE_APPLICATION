import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  static String routeName = "\start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() => AppBar();

  buildBody() => Container();
}