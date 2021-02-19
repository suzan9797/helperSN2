import 'package:flutter/material.dart';

class JoinOptions extends StatefulWidget {
  @override
  _JoinOptionsState createState() => _JoinOptionsState();
}

class _JoinOptionsState extends State<JoinOptions> {
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
          ListView(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  height: 300,
                  width: mdw / 1.1,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 12)),
                          //start Professional option
                          RaisedButton(
                              color: Color(0xff6e475b),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              onPressed: () {
                                Navigator.of(context).pushNamed('ProRegister');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Create a Professional Account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontFamily: 'YuseiMagic')),
                                ],
                              )),
                          //end Professional option
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text(
                            '- OR -',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 22,
                                fontFamily: 'YuseiMagic'),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          //start user option
                          RaisedButton(
                              color: Color(0xff6e475b),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 55, vertical: 25),
                              onPressed: () {
                                Navigator.of(context).pushNamed('UserRegister');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Create a User Account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontFamily: 'YuseiMagic')),
                                ],
                              )),
                          //end user option
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //end box form
        ],
      ),
    );
  }
}
