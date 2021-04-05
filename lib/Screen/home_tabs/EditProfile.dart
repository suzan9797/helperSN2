import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  DocumentSnapshot docToEdit;

  EditProfile({
    this.docToEdit,
  });
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // Firestore.instance.collection('Users');
    //name = TextEditingController(text: widget.docToEdit.data['Full name']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Name'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              //widget.docToEdit.reference.updateData({
              //'Full name': name.text,
              //  }).whenComplete(() => Navigator.pop(context));
            },
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: name,
                // maxLines: null,
                // expands: true,
                // decoration: InputDecoration(hintText: 'Full name'),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
