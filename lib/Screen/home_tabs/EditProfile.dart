import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController displayNameController = TextEditingController();

  @override
  void dispose() {
    displayNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getProData();

    super.initState();
  }

  QuerySnapshot proData;
  Future getProData() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: user.uid)
          .getDocuments()
          .then((value) {
        setState(() {
          proData = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
        ),
        body: editData(context));
  }

  Widget editData(BuildContext context) {
    if (proData == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: proData.documents.length,
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
                              backgroundImage:
                                  AssetImage('images/proffession.png'),
                            ),
                            //Positioned(
                            // bottom: 3,
                            // right: 2,
                            //child: GestureDetector(
                            //onTap: () {},
                            //child: Icon(
                            //  Icons.camera_alt,
                            //  color: Colors.white,
                            //  ),
                            // ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextField(
                        controller: displayNameController,
                        decoration: InputDecoration(
                            hintText: proData.documents[i].data['Full name']
                                .toString()),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 290.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                          child: Text(
                            'Edit ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 1.3),
                          ),
                          color: Color(0xff6e475b),
                          onPressed: () async {
                            if (displayNameController.text == null) {
                              //do nothing
                            } else {
                              await Firestore.instance
                                  .collection('Users')
                                  .document(proData.documents[i].documentID)
                                  .updateData({
                                'Full name': displayNameController.text
                              });
                              Navigator.pop(context);
                            }
                          }),
                      SizedBox(width: 10),
                      RaisedButton(
                          child: Text(
                            'Cancel ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 1.3),
                          ),
                          color: Color(0xff6e475b),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ],
            );
          });
    }
  }
}
