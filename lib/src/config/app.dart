import 'package:WBM_platform/src/config/routes.dart';
import 'package:WBM_platform/src/screens/home_screen/home_screen.dart';
import 'package:WBM_platform/src/screens/start_screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WBM_platform',
      theme: _buildThemeData(),
      initialRoute: FirebaseAuth.instance.currentUser == null ? StartScreen.routeName : HomeScreen.routeName,
      routes: routes,
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      fontFamily: "Poppins",
      appBarTheme: _buildAppBarTheme(),
      textTheme: _buildTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: _buildInputDecorationTheme(),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: kTextColor,
      ),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 20,
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

  TextTheme _buildTextTheme() => TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor),
      );

  AppBarTheme _buildAppBarTheme() => AppBarTheme(
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      );
}
