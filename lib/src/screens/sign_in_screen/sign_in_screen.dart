import 'package:WBM_platform/src/screens/sign_in_screen/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {

  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(),
    );
  }

  AppBar _buildAppBar() => AppBar(
    title: Text("Sign in"),
  );
}