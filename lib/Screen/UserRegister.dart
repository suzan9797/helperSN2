import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  _UserRegister createState() => _UserRegister();
}

class _UserRegister extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
      ),
      //start background design
      Positioned(
        child: Transform.scale(
          scale: 4,
          child: Transform.translate(
            offset: Offset(0, -190),
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
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Sign up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'YuseiMagic'),
              ),
            ),
          ),
        ],
      ),
      //start box form
      Center(
        child: Container(
          height: 520,
          width: mdw / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black, spreadRadius: 0.4, offset: Offset(1, 1))
            ],
          ),
          child: Form(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //start text first name
                  Text('First Name:',
                      style: TextStyle(color: Colors.grey[800], fontSize: 20)),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Enter Your First Name',
                      filled: true,
                      fillColor: Colors.white,
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
                  //end text first name
                  SizedBox(height: 5),
                  //start text last name
                  Text(
                    'Last Name:',
                    style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Enter Your Last Name',
                      filled: true,
                      fillColor: Colors.white,
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
                  //end text Last Name
                  SizedBox(height: 5),
                  //start text email
                  Text(
                    'Email:',
                    style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Enter Your Email',
                      filled: true,
                      fillColor: Colors.white,
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
                  SizedBox(height: 5),
                  //start text city
                  Text(
                    'City:',
                    style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Enter Your City',
                      filled: true,
                      fillColor: Colors.white,
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
                  SizedBox(height: 5),
                  //start text password
                  Text(
                    'Password:',
                    style: TextStyle(color: Colors.grey[800], fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Enter Your password',
                      filled: true,
                      fillColor: Colors.white,
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
      //end box form
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 650),
          child: Column(
            children: [
              //start sign up button
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
                    Text('SIGN UP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'YuseiMagic')),
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_forward, color: Colors.white))
                  ],
                ),
              ),
              //end sign up button
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(color: Colors.black)),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('Login');
                    },
                    child: Text('Login',
                        style: TextStyle(
                            color: Color(0xff6e475b),
                            fontWeight: FontWeight.w700)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
