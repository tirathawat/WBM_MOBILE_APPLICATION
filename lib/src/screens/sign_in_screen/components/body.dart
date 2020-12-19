import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/screens/sign_in_screen/components/sign_in_form.dart';
import 'package:WBM_platform/src/widgets/no_account_text.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Text(
                "Welcome Back",
                style: headingStyle,
              ),
              Text(
                "Sign in with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignInForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              NoAccoutText(),
            ],
          ),
        ),
      ),
    );
  }
}