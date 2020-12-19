import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/screens/start_screen/components/body.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  static String routeName = "\start";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}