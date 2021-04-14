import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPro extends StatefulWidget {
  @override
  _DrawerProState createState() => _DrawerProState();
}

class _DrawerProState extends State<DrawerPro> {
  var name;
  var email;
  FirebaseUser _pro;
  bool isSignIn = false;

  getPro() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: user.uid)
          .getDocuments()
          .then((value) {
        setState(() {
          name = value.documents[0]['Full name'];
          _pro = user;
        });
      });
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();

    name = preferences.getString('name');
    email = preferences.getString('email');

    if (name != null) {
      setState(() {
        name = preferences.getString('name');
        email = preferences.getString('email');
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: isSignIn
                ? Text(name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'YuseiMagic'))
                : Text(''),
            accountEmail: isSignIn
                ? Text(
                    email,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'YuseiMagic'),
                  )
                : Text(''),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/proffession.png'),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('My Order'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.home,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('MyOrder');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Profile'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.person,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(' ProProfile ');
            },
          ),
          isSignIn
              ? ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  title: Text(
                    ('LogOut'),
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xff6e475b),
                    size: 25,
                  ),
                  onTap: () async {
                    FirebaseAuth.instance.signOut().then((_) async {
                      // SharedPreferences preferences =
                      //     await SharedPreferences.getInstance();
                      // preferences.remove('name');
                      // preferences.remove('email');
                      Navigator.of(context).pushNamed('Login');
                    });
                  },
                )
              : ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  title: Text(
                    ('LogIn'),
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.login,
                    color: Color(0xff6e475b),
                    size: 25,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('Login');
                  },
                ),
        ],
      ),
    );
  }
}
