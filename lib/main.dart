import 'package:flutter/material.dart';
import 'package:helper/Screen/login.dart';
import 'package:helper/utilties/app_theme.dart';
import 'Screen/OnBoarding.dart';
import 'Screen/UserRegister.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'UserRegister': (context) {
          return UserRegister();
        },
        'Login': (context) {
          return Login();
        },
      },
      theme: AppTheme.appTheme,
      home: OnBoarding(),
    );
  }
}
