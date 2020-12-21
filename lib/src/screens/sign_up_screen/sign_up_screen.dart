import 'package:WBM_platform/src/screens/sign_up_screen/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(),
    );
  }

  AppBar _buildAppBar() => AppBar(
    title: Text("Sign up"),
  );
}