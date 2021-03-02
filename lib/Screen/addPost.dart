import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  File _file;
  String _url;

  Future pickerCamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
  }

  Future uploadImage(Context) async {
    // try {
    FirebaseStorage storage =
        FirebaseStorage(storageBucket: 'gs://helper-4f669.appspot.com');
    StorageReference ref = storage.ref().child(p.basename(_file.path));
    StorageUploadTask storageUploadTask = ref.putFile(_file);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text('success'),
    // ));
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
    // print('url $url');
    // setState(() {
    //   _url = url;
    // });
    // } catch (e) {
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //     content: Text(e.message),
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Form(
          key: _key,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.camera_alt), onPressed: pickerCamera),
                  Builder(
                    builder: (context) => RaisedButton(
                      child: Text('Upload Image'),
                      onPressed: () {
                        uploadImage(context);
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: _file == null ? Text('not selected') : Image.file(_file),
              )
            ],
          ),
        )),
      ),
    );
  }
}
