import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProRegister extends StatefulWidget {
  @override
  _ProRegisterState createState() => _ProRegisterState();
}

class _ProRegisterState extends State<ProRegister> {
  String valueSelect;
  List listpro = [
    'Carpentry',
    'Grass',
    'Painting',
    'Plumbing',
    'Electrical',
    'A/C'
  ];
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  GlobalKey<FormState> formProRegister = new GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String error;
  String _role = 'Professional Account';
  int like = 0;
  int dislike = 0;

  String validFullName(String value) {
    if (value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String validEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
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

  void prosignup() async {
    if (!formProRegister.currentState.validate()) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      final result = await _auth.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);

      if (result == null) {
        setState(() {
          isLoading = false;
          error = 'User registeration error';
        });
      } else {
        Firestore.instance
            .collection("Users")
            .document(result.user.uid)
            .setData({
          'Full name': _fullName.text,
          'Email': _email.text,
          'Profession': valueSelect,
          'role': _role,
          'UserID': result.user.uid,
          'Like': like,
          'Dislike': dislike,
        });
        Navigator.of(context).pushNamed('Login');
      }
    }
  }

  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? loading(context) : form(context),
    );
  }

  Widget form(BuildContext context) {
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
                          key: formProRegister,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),

                                //start text full name
                                buildTextFormFieldAll('Enter your full name',
                                    false, _fullName, validFullName),
                                //end text full name
                                SizedBox(height: 20),

                                //start text email
                                buildTextFormFieldAll('Enter your Email', false,
                                    _email, validEmail),
                                //end text email
                                SizedBox(height: 20),

                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                      validator: (newValue) => newValue == null
                                          ? "profession is required"
                                          : null,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none),
                                      hint: Text('Choose your profession:'),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 35,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 17),
                                      value: valueSelect,
                                      onChanged: (newValue) {
                                        setState(() {
                                          valueSelect = newValue;
                                        });
                                      },
                                      items: listpro
                                          .map<DropdownMenuItem<String>>(
                                              (valueItem) {
                                        return DropdownMenuItem<String>(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList()),
                                ),
                                //end drop pro

                                SizedBox(height: 20),
                                //end text passwoed
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
                  onPressed: prosignup,
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
                _errorMessage(context),
                SizedBox(height: 10),
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

  Widget loading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
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
