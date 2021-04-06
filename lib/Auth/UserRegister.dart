import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  _UserRegister createState() => _UserRegister();
}

class _UserRegister extends State<UserRegister> {
  TextEditingController _fname = new TextEditingController();
  TextEditingController _lname = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  GlobalKey<FormState> formUserRegister = new GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String error;
  String _role = 'User';

  String validFname(String val) {
    if (val.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  String validLname(String val) {
    if (val.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

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

  String validPasswoed(String val) {
    if (val.isEmpty) {
      return "Password is required";
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
      final result = await _auth.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);

      if (result.user == null) {
        setState(() {
          isLoading = false;
          error = 'User registeration error';
        });
      } else {
        await Firestore.instance
            .collection("Users")
            .document(result.user.uid)
            .setData({
          'First name': _fname.text,
          'Last name': _lname.text,
          'Email': _email.text,
          "role": _role,
          'UserID': result.user.uid,
        });
        Navigator.of(context).pushNamed('Login');
      }
    }
  }

  void dispose() {
    _fname.dispose();
    _lname.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
              offset: Offset(0, -180),
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
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
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
                child: Container(
                    margin: EdgeInsets.only(top: 180),
                    height: 390,
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
                          key: formUserRegister,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                //start text first name
                                buildTextFormFieldAll('Enter Your First Name',
                                    false, _fname, validFname),
                                //end text first name

                                SizedBox(height: 20),

                                //start text last name
                                buildTextFormFieldAll('Enter Your Last Name',
                                    false, _lname, validLname),
                                //end text last name
                                SizedBox(height: 20),

                                //start text email
                                buildTextFormFieldAll('Enter Your Email', false,
                                    _email, validEmail),
                                //end text email

                                SizedBox(height: 20),

                                //start text passwoed

                                buildTextFormFieldAll('Enter Your password',
                                    true, _password, validPasswoed)

                                //end text passwoed
                              ],
                            ),
                          )),
                    )))
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
                SizedBox(height: 10),
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
        labelText: myhinttext,
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
