import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  _UserRegister createState() => _UserRegister();
}

class _UserRegister extends State<UserRegister> {
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  //TextEditingController city = new TextEditingController();
  TextEditingController password = new TextEditingController();

  GlobalKey<FormState> formUserRegister = new GlobalKey<FormState>();

  //bool autovalid = false;
  bool isLoading = false;
  String error;

  String validFname(String val) {
    if (val.isEmpty) {
      return "First name can't to be empty";
    }
    return null;
  }

  String validLname(String val) {
    if (val.isEmpty) {
      return "Last name can't to be empty";
    }
    return null;
  }

  String validEmail(String val) {
    if (val.isEmpty) {
      return "Email can't to be empty";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return "Enter valid email";
    }
    return null;
  }

  String validPasswoed(String val) {
    if (val.isEmpty) {
      return "Password can't to be empty";
    }
    return null;
  }

  void usersignup() async {
    if (!formUserRegister.currentState.validate()) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      if (result.user == null) {
        setState(() {
          isLoading = false;
          error = 'User registeration error';
        });
      } else {
        Navigator.of(context).pushNamed('Login');
      }
    }
  }

  void dispose() {
    fname.dispose();
    lname.dispose();
    email.dispose();
    // city.dispose();
    password.dispose();
    super.dispose();
  }

  String valueChoose;
  List listitem = ['Jeddah', 'Riyadh', 'Dammam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? _loading(context) : _form(context),
    );
  }

  Widget _form(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Stack(
      children: [
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
        ListView(
          children: [
            Center(
                child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(top: 90),
                  height: 555,
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
                      key: formUserRegister,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //start text first name
                            Text(
                              'First Name:',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            buildTextFormFieldAll('Enter Your First Name',
                                false, fname, validFname),
                            //end text first name
                            SizedBox(height: 5),

                            //start text last name
                            Text(
                              'Last Name:',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            buildTextFormFieldAll('Enter Your Last Name', false,
                                lname, validLname),
                            //end text last name
                            SizedBox(height: 5),

                            //start text email
                            Text(
                              'Email:',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            buildTextFormFieldAll(
                                'Enter Your Email', false, email, validEmail),
                            //end text email

                            SizedBox(height: 5),
                            Text('City',
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 20)),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: DropdownButtonFormField(
                                  hint: Text('Select your city:'),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 35,
                                  isExpanded: true,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                  value: valueChoose,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                    });
                                  },
                                  items: listitem.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList()),
                            ),

                            //end dropDown
                            SizedBox(height: 5),

                            //start text passwoed
                            Text(
                              'Password:',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            buildTextFormFieldAll('Enter Your password', true,
                                password, validPasswoed)

                            //end text passwoed
                          ],
                        ),
                      ))),
            ))
          ],
        ),
        //end box form
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 700),
            child: Column(
              children: [
                //start sign up button
                RaisedButton(
                  color: Color(0xff6e475b),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  onPressed: usersignup,
                  // () {
                  //   Navigator.of(context).pushNamed('home');
                  // },
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
                SizedBox(height: 20),
                _errorMessage(context),
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
      ],
    );
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController mycontroller, myvalid) {
    return TextFormField(
      controller: mycontroller,
      obscureText: pass,
      validator: myvalid,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey[600]),
        hintText: myhinttext,
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
    );
  }

  Widget _errorMessage(BuildContext context) {
    if (error == null) {
      return Container();
    }
    return Container(
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
