import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/widgets/custom_surffix_icon.dart';
import 'package:WBM_platform/src/widgets/default_button.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: Column(
          children: [
            _buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            _buildPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            DefaultButton(text: "Continue", press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },),
          ],
        ),
      ),
    );
  }

  TextFormField _buildEmailFormField() => TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/Mail.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kEmailNullError;
          else if (!emailValidatorRegExp.hasMatch(value))
            return kInvalidEmailError;
          else
            return null;
        },
      );

      TextFormField _buildPasswordFormField() => TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/Lock.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kPassNullError;
          else if (value.length < 8)
            return kShortPassError;
          else
            return null;
        },
      );
}
