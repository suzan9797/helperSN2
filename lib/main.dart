import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/RentElectronics.dart';
import 'package:helper/Screen/Rent/RentGames.dart';
import 'package:helper/Screen/Rent/RentHome.dart';
import 'package:helper/Screen/Rent/RentOther.dart';
import 'package:helper/Screen/Rent/RentTools.dart';
import 'package:helper/Screen/home_screen.dart';
import 'package:helper/Screen/home_tabs/Carpentry.dart';
import 'package:helper/Screen/login.dart';
import 'package:helper/utilties/app_theme.dart';
import 'Screen/OnBoarding.dart';
import 'Screen/UserRegister.dart';
import 'Screen/home_tabs/A/C.dart';
import 'Screen/home_tabs/Grass.dart';
import 'Screen/home_tabs/details.dart';
import 'Screen/home_tabs/electrical.dart';
import 'Screen/home_tabs/painting.dart';
import 'Screen/home_tabs/plumbing.dart';

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
        },
        'Grass': (context) {
          return Grass();
        },
        'Painting': (context) {
          return Painting();
        },
        'Plumbing': (context) {
          return Plumbing();
        },
        'Electrical': (context) {
          return Electrical();
        },
        'AirCondition': (context) {
          return AirCondition();
        },
        'RentHome': (context) {
          return RentHome();
        },
        'RentTools': (context) {
          return RentTools();
        },
        'RentGames': (context) {
          return RentGames();
        },
        'RentOther': (context) {
          return RentOther();
        }
      },
      theme: AppTheme.appTheme,
      home: OnBoarding(),
    );
  }
}
