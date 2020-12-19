import 'package:WBM_platform/src/app_config/constants.dart';
import 'package:WBM_platform/src/app_config/routes.dart';
import 'package:WBM_platform/src/screens/start_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WBM_platform',
      theme: buildThemeData(),
      initialRoute: StartScreen.routeName,
      routes: routes,
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: "Poppins",
      appBarTheme: buildAppBarTheme(),
      textTheme: buildTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: buildInputDecorationTheme(),
    );
  }

  InputDecorationTheme buildInputDecorationTheme() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
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

  TextTheme buildTextTheme() => TextTheme(
        bodyText1: TextStyle(color: kTextColor),
        bodyText2: TextStyle(color: kTextColor),
      );

  AppBarTheme buildAppBarTheme() => AppBarTheme(
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xFF8B8B8B),
            fontSize: 18,
          ),
        ),
      );
}
