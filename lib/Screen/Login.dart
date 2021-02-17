//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 90)),
                  CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/Logo.png')),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'YuseiMagic'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //end avatar

          //start box form
          ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 260),
                  height: 250,
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
                  child: Form(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //start text email
                          Text(
                            'Email:',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              hintText: 'Enter Your Email',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.email,
                                  size: 30,
                                  color: Color(0xff6e475b),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          //end text email

                          //start text password
                          SizedBox(height: 10),
                          Text(
                            'Password:',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 20),
                          ),

                          Padding(padding: EdgeInsets.only(top: 10)),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              hintText: 'Enter Your password',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.vpn_key_sharp,
                                  size: 30,
                                  color: Color(0xff6e475b),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          //end text passwoed
                        ],
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
              margin: EdgeInsets.only(top: 590),
              child: Column(
                children: [
                  //start login button
                  RaisedButton(
                    color: Color(0xff6e475b),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    onPressed: () {
                      Navigator.of(context).pushNamed('home');
                    },
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
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'forgot password ?',
                      style: TextStyle(
                          color: Color(0xff6e475b),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 90),
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
}
