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
                                  _image == null ? null : FileImage(_image),
                            ),
                            Positioned(
                              bottom: 3,
                              right: 2,
                              child: GestureDetector(
                                onTap: pickImage,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Builder(
                          builder: (context) => RaisedButton(
                            onPressed: () {
                              uploadImage(context);
                            },
                            child: Text('Upload Image'),
                          ),
                        )
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
                          trailing: Icon(Icons.edit, color: Colors.grey),
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
                          onTap: () {
                            Navigator.of(context).pushNamed(' EditProfile');
                          },
                        ),
                        SizedBox(
                          height: 0.25,
                        ),
                        // ListTile(
                        //   title: Text(' City:'),
                        //   subtitle: Text(
                        //     profileView.documents[i].data['City'].toString(),
                        //     style: TextStyle(fontSize: 18.0),
                        //   ),
                        //   leading: Icon(
                        //     Icons.location_city,
                        //     color: Color(0xff6e475b),
                        //   ),
                        //   onTap: () {},
                        // ),
                        SizedBox(
                          height: 0.25,
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
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 0.25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
  }

  void pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  String imagURL;
  void uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://helper-4f669.appspot.com');
      StorageReference ref = storage.ref().child(p.basename(_image.path));
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String _url = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        imagURL = _url;
      });
      setViewprofile().then((val) {
        Navigator.of(context).pop();
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }

  Future setViewprofile() async {
    await FirebaseAuth.instance.currentUser().then((user) async {
      await Firestore.instance.collection('Users').document().setData({
        'profil Image': imagURL,
      }).then((_) {
        Navigator.of(context).pop();
      });
    });
  }
}
