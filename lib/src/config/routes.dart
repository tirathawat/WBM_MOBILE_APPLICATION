import 'package:WBM_platform/src/screens/chat_detail_screen/chat_detail_screen.dart';
import 'package:WBM_platform/src/screens/home_screen/home_screen.dart';
import 'package:WBM_platform/src/screens/sign_in_screen/sign_in_screen.dart';
import 'package:WBM_platform/src/screens/sign_up_screen/sign_up_screen.dart';
import 'package:WBM_platform/src/screens/start_screen/start_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  StartScreen.routeName: (context) => StartScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ChatDetailScreen.routeName: (context) => ChatDetailScreen(),
};