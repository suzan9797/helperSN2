import 'package:flutter/material.dart';
import 'package:helper/Screen/Electronics.dart';
import 'package:helper/Screen/home_screen.dart';
import 'package:helper/Screen/home_tabs/Carpentry.dart';
import 'package:helper/Screen/login.dart';
import 'package:helper/utilties/app_theme.dart';
import 'Screen/OnBoarding.dart';
import 'Screen/UserRegister.dart';
import 'Screen/home_tabs/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) {
          return HomeScreen();
        },
        'UserRegister': (context) {
          return UserRegister();
        },
        'Login': (context) {
          return Login();
        },
        'Carpentry': (context) {
          return Carpentry();
        },
        'details': (context) {
          return Details();
        },
        'electronic': (context) {
          return Electronics();
        }
      },
      theme: AppTheme.appTheme,
      home: OnBoarding(),
    );
  }
}
