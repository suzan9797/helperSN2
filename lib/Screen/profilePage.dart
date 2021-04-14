import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  QuerySnapshot profileView;
  File _image;
  String _url;
  @override
  void initState() {
    getViewprofile();
    super.initState();
  }

  Future getViewprofile() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: user.uid)
          .getDocuments()
          .then((value) {
        setState(() {
          profileView = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile '),
          centerTitle: true,
        ),
        body: profilesView(context));
  }

  Widget profilesView(BuildContext context) {
    if (profileView == null) {
      return Center(
          child: Text(
        ' You Dont not have User Accounts...',
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color((0xff6e475b))),
      ));
    } else
      return ListView.builder(
          itemCount: profileView.documents.length,
          itemBuilder: (context, i) {
            return Column(
              children: <Widget>[
                Container(
                  color: Color(0xff6e475b),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage('images/user.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'User Information ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff6e475b),
                                fontFamily: 'YuseiMagic'),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 0.25,
                        ),
                        ListTile(
                          title: Text('  Email :'),
                          subtitle: Text(
                            profileView.documents[i].data['Email'].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.email,
                            color: Color(0xff6e475b),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 0.25,
                        ),
                        ListTile(
                          title: Text('  User Name:'),
                          subtitle: Text(
                            profileView.documents[i].data['First name']
                                .toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.edit_road,
                            color: Color(0xff6e475b),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 0.25,
                        ),
                        SizedBox(
                          height: 0.25,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: RaisedButton(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.3),
                    ),
                    color: Color(0xff6e475b),
                    onPressed: () {
                      Navigator.of(context).pushNamed(' EditUserProfile');
                    },
                  ),
                ),
              ],
            );
          });
  }
}
