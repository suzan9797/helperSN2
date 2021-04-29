import 'package:flutter/material.dart';
import 'package:helper/Admin/homeAdmin.dart';
import 'package:helper/Admin/proAdmin.dart';
import 'package:helper/Admin/productAdmin.dart';
import 'package:helper/Admin/userAdmin.dart';
import 'package:helper/Auth/JoinOptions.dart';
import 'package:helper/Auth/ProRegister.dart';
import 'package:helper/Screen/Rent/MyProduct/MyProducts.dart';
import 'package:helper/Screen/Rent/RentElectronics.dart';
import 'package:helper/Screen/Rent/RentGames.dart';
import 'package:helper/Screen/Rent/RentHome.dart';
import 'package:helper/Screen/Rent/RentOther.dart';
import 'package:helper/Screen/Rent/RentTools.dart';
import 'package:helper/Screen/Rent/MyOrders/UserOrders.dart';
import 'package:helper/Screen/Rent/addPost.dart';
import 'package:helper/Screen/home_screen.dart';
import 'package:helper/Screen/home_tabs/AboutUs.dart';
import 'package:helper/Screen/home_tabs/Carpentry.dart';
import 'package:helper/Auth/login.dart';
import 'package:helper/Screen/home_tabs/EditProfile.dart';
import 'package:helper/Screen/home_tabs/EditUserProfile.dart';
import 'package:helper/Screen/home_tabs/OrderConfirm.dart';
import 'package:helper/Screen/home_tabs/orders.dart';
import 'package:helper/Screen/home_tabs/proProfile.dart';
import 'package:helper/utilties/app_theme.dart';
import 'Screen/OnBoarding.dart';
import 'Auth/UserRegister.dart';
import 'Screen/home_tabs/AirCondition.dart';
import 'Screen/home_tabs/Grass.dart';
import 'Screen/home_tabs/electrical.dart';
import 'Screen/home_tabs/painting.dart';
import 'Screen/home_tabs/plumbing.dart';
import 'Screen/profilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        },
        'ProfilePage ': (context) {
          return ProfilePage();
        },
        'JoinOptions': (context) {
          return JoinOptions();
        },
        'ProRegister': (context) {
          return ProRegister();
        },
        'orderConfirm': (context) {
          return OrderConfirm();
        },
        'AddPost': (context) => AddPost(),
        'order': (context) {
          return Orders();
        },
        'MyOrder': (context) {
          return Orders();
        },
        'AboutUs': (context) {
          return AboutUs();
        },
        ' ProProfile ': (context) => ProProfile(),
        ' EditProfile': (context) => EditProfile(),
        ' EditUserProfile': (context) => EditUserProfile(),
        'Admin': (context) => Admin(),
        "ProAdmin": (context) => ProAdmin(),
        "UsersAdmin": (context) => UsersAdmin(),
        'UserOrders': (context) => UserOrders(),
        'MyProducts': (context) => MyProducts(),
        'productAdmin': (context) => ProductAdmin(),
      },
      theme: AppTheme.appTheme,
      home: OnBoarding(),
    );
  }
}
