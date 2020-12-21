import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/screens/sign_up_screen/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import 'have_account_text.dart';

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
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Register",
                style: headingStyle,
              ),
              Text(
                "Sign up with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              HaveAccoutText(),
            ],
          ),
        ),
      ),
    );
  }
}