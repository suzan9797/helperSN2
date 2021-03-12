import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addimage extends StatefulWidget {
  @override
  _AddimageState createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  File _file;
  String _url;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Make a Choice!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        pickerGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        pickerCamera(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }

  Future pickerCamera(BuildContext context) async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
    Navigator.of(context).pop();
  }

  Future pickerGallery(BuildContext context) async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile.path);
    });
    Navigator.of(context).pop();
  }

  Future uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://helper-4f669.appspot.com');
      StorageReference ref = storage.ref().child(p.basename(_file.path));
      StorageUploadTask storageUploadTask = ref.putFile(_file);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  //color: Colors.black,
                  height: 350,
                  width: 400,
                  child: Center(
                    child: _file == null ? Text("No image") : Image.file(_file),
                  ),
                ),
                SizedBox(height: 30),
                IconButton(
                    icon: Icon(Icons.add_a_photo, size: 30),
                    onPressed: () {
                      _showChoiceDialog(context);
                    }),
                SizedBox(height: 50),
                Builder(
                  builder: (context) => RaisedButton(
                    color: Color(0xff6e475b),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'YuseiMagic'),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    onPressed: () {
                      uploadImage(context).whenComplete(
                          () => Navigator.of(context).pushNamed('AddPost'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
