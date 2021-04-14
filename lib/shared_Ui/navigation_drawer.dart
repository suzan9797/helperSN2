import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var name;
  var email;
  var image;
  FirebaseUser _user;
  bool isSignIn = false;

  getPref() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: user.uid)
          .getDocuments()
          .then((value) {
        setState(() {
          name = value.documents[0]['First name'];
          _user = user;
        });
      });
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();

    name = preferences.getString('name');
    email = preferences.getString('email');
    image = preferences.getString('image');

    if (name != null) {
      setState(() {
        name = preferences.getString('name');
        email = preferences.getString('email');
        image = preferences.getString('image');
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: isSignIn
                ? Text(name,
                    style: TextStyle(fontSize: 20.0, fontFamily: 'YuseiMagic'))
                : Text(''),
            accountEmail: isSignIn
                ? Text(email,
                    style: TextStyle(fontSize: 20.0, fontFamily: 'YuseiMagic'))
                : Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
              maxRadius: 6,
            ),
            decoration: BoxDecoration(color: Color(0xff6e475b)),
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Home Page'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.home,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('home');
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
              Navigator.of(context).pushNamed('ProfilePage ');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('My Orders'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.assignment_sharp,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('UserOrders');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('My products'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.category_rounded,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('MyProducts');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('About Us'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.reduce_capacity,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('AboutUs');
            },
          ),
          isSignIn
              ? ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  title: Text(
                    ('Logout'),
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xff6e475b),
                    size: 25,
                  ),
                  onTap: () async {
                    FirebaseAuth.instance.signOut().then((_) async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.remove('name');
                      preferences.remove('email');
                      Navigator.of(context).pushNamed('home');
                    });
                  },
                )
              : ListTile(
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  title: Text(
                    ('Login'),
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
