import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:helper/Auth/reset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //start form controller
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  GlobalKey<FormState> formStateLogin = new GlobalKey<FormState>();

  savePref(String name, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
    preferences.setString('email', email);
    print(preferences.getString('name'));
    print(preferences.getString('email'));
  }

  savePro(String name, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
    preferences.setString('email', email);
    print(preferences.getString('name'));
    print(preferences.getString('email'));
  }

  final _auth = FirebaseAuth.instance;

  String _error;

  String validEmail(String val) {
    if (val.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return "Enter valid email";
    }
    return null;
  }

  String validPassword(String val) {
    if (val.isEmpty) {
      return "Password is required";
    }

    return null;
  }

  Future login() async {
    if (formStateLogin.currentState.validate()) {
      try {
        final result = await _auth.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);
        if (result != null) {
          print(result.user.uid);
          await Firestore.instance
              .collection('Users')
              .document(result.user.uid)
              .get()
              .then((value) {
            switch (value.data['role']) {
              case 'User':
                {
                  savePref('name', _email.text);

                  return Navigator.of(context).pushNamed('home');
                }
                break;
              case 'Professional Account':
                {
                  savePro('name', _email.text);
                  return Navigator.of(context).pushNamed('order');
                }
                break;
              case 'admin':
                {
                  return Navigator.of(context).pushNamed('Admin');
                }
            }
          });
        } else {
          showInSnackBar('Invalid email or password');
        }
      } on PlatformException catch (e) {
        showInSnackBar('Invalid Email or Password');
      } catch (s) {
        showInSnackBar('Invalid Email or Password');
      }
    }
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          //start background design
          Positioned(
            child: Transform.scale(
              scale: 1.5,
              child: Transform.translate(
                offset: Offset(0, -30),
                child: Container(
                  height: mdw,
                  width: mdw,
                  decoration: BoxDecoration(
                      color: Color(0xff6e475b),
                      borderRadius: BorderRadius.circular(mdw)),
                ),
              ),
            ),
          ),
          //end background design

          //start avatar
          Container(
            height: mdw,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 100)),
                CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('images/Logo.png')),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'YuseiMagic'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //end avatar

          //start box form
          ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 280),
                  height: 220,
                  width: mdw / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.4,
                          offset: Offset(1, 1))
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formStateLogin,
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            buildTextFormFieldAll('Enter Your Email', false,
                                _email, validEmail, Icons.email),
                            //end text email

                            //start text password
                            SizedBox(height: 20),
                            buildTextFormFieldAll('Enter Your password', true,
                                _password, validPassword, Icons.lock),

                            //end text passwoed
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //end box form

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 620),
              child: Column(
                children: [
                  //start login button
                  RaisedButton(
                    color: Color(0xff6e475b),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    onPressed: login,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'YuseiMagic'),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  //end login button
                  // _errorMessage(context),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ResetScreen())),
                    child: Text(
                      'forgot password ?',
                      style: TextStyle(
                          color: Color(0xff6e475b),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: 65),
                  showAlert(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('JoinOptions');
                        },
                        child: Text('Sign up',
                            style: TextStyle(
                                color: Color(0xff6e475b),
                                fontWeight: FontWeight.w700)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController mycontroller, myvalid, IconData icon) {
    return TextFormField(
      controller: mycontroller,
      obscureText: pass,
      validator: myvalid,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey[600]),
        labelText: myhinttext,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(icon, color: Color(0xff6e475b)),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.grey,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(),
      );
    }
    return SizedBox(height: 0);
  }

  // Widget _errorMessage(BuildContext context) {
  //   if (_error == null) {
  //     return Container();
  //   }
  //   return Container(
  //     child: Text(
  //       _error,
  //       style: TextStyle(color: Colors.red),
  //     ),
  //   );
  // }
}
