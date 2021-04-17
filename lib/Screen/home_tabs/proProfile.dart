import 'dart:io';
//import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProProfile extends StatefulWidget {
  @override
  _ProProfileState createState() => _ProProfileState();
}

class _ProProfileState extends State<ProProfile> {
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
        child: CircularProgressIndicator(),
      );
    } else
      return ListView.builder(
          itemCount: profileView.documents.length,
          itemBuilder: (context, i) {
            return Column(
              children: <Widget>[
                Container(
                  color: Color(0xff6e475b),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    AssetImage('images/proffession.png')),
                          ],
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
                        ),
                        ListTile(
                          title: Text('  User Name:'),
                          subtitle: Text(
                            profileView.documents[i].data['Full name']
                                .toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.edit_road,
                            color: Color(0xff6e475b),
                          ),
                        ),
                        ListTile(
                          title: Text(' Profession:'),
                          subtitle: Text(
                            profileView.documents[i].data['Profession']
                                .toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.work_rounded,
                            color: Color(0xff6e475b),
                          ),
                        ),
                        ListTile(
                          title: Text(' Likes:'),
                          subtitle: Text(
                            profileView.documents[i].data['Like'].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.thumb_up,
                            color: Color(0xff6e475b),
                          ),
                        ),
                        ListTile(
                          title: Text(' Disikes:'),
                          subtitle: Text(
                            profileView.documents[i].data['Dislike'].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.thumb_down,
                            color: Color(0xff6e475b),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
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
                      Navigator.of(context).pushNamed(' EditProfile');
                    },
                  ),
                ),
              ],
            );
          });
  }
}
