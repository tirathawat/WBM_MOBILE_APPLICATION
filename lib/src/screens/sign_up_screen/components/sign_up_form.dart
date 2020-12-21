import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/models/user_data.dart';
import 'package:WBM_platform/src/screens/home_screen/home_screen.dart';
import 'package:WBM_platform/src/widgets/custom_surffix_icon.dart';
import 'package:WBM_platform/src/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserData _userData;

  ProgressDialog progressDialog;

  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    _userData = null;
    databaseReference =
        FirebaseDatabase.instance.reference().child("user_data");
  }

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
            _userData == null
                ? _buildFirstNameFormField()
                : _buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            _userData == null
                ? _buildLastNameFormField()
                : _buildPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            _userData == null
                ? _buildPhoneNumberFormField()
                : _buildConfirmPasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  if (_userData == null) {
                    setState(() {
                      _userData = UserData();
                      _userData.setFirstName = _firstNameController.text;
                      _userData.setLastName = _lastNameController.text;
                      _userData.setPhoneNumber = _phoneNumberController.text;
                    });
                  } else {
                    _userData.setEmail = _emailController.text;
                    _register();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildFirstNameFormField() => TextFormField(
        controller: _firstNameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "First name",
          hintText: "Enter your first name",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/User.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kNameNullError;
          else
            return null;
        },
      );

  TextFormField _buildLastNameFormField() => TextFormField(
        controller: _lastNameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Last name",
          hintText: "Enter your last name",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/User.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kNameNullError;
          else
            return null;
        },
      );

  TextFormField _buildPhoneNumberFormField() => TextFormField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Phone number",
          hintText: "Enter your phone number",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/Phone.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kPhoneNumberNullError;
          else
            return null;
        },
      );

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

  TextFormField _buildConfirmPasswordFormField() => TextFormField(
        controller: _confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Confirm Password",
          hintText: "Enter your password",
          suffixIcon: CustomSurffixIcon(
            image: "assets/icons/Lock.svg",
          ),
        ),
        validator: (value) {
          if (value.isEmpty)
            return kConfirmPassNullError;
          else if (value != _passwordController.text)
            return kMatchPassError;
          else
            return null;
        },
      );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    await progressDialog.show();
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      await progressDialog.hide();
      databaseReference.child(user.uid).set(_userData.toJson());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} signed in"),
      ));
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } on Exception catch (e) {
      await progressDialog.hide();
      if (e.toString() == kFIREBASE_AUTH_EMAIL_ALREADY_IN_USE) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(kERROR_EMAIL_EMAIL_ALREADY_IN_USE),
        ));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed to sign up with Email & Password"),
        ));
      }
    }
  }
}
