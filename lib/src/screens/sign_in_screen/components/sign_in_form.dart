import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/screens/home_screen/home_screen.dart';
import 'package:WBM_platform/src/widgets/custom_surffix_icon.dart';
import 'package:WBM_platform/src/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: "Loading...",
    );
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
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _signInWithEmailAndPassword();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildEmailFormField() => TextFormField(
        controller: _emailController,
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
        controller: _passwordController,
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    await progressDialog.show();
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      await progressDialog.hide();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} signed in"),
      ));
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } catch (e) {
      await progressDialog.hide();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }
}
