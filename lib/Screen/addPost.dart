import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String categorySelect;
  List listcategory = ['Electronics', 'Games', 'Home', 'Tools', 'Other'];

  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  TextEditingController _productName = new TextEditingController();
  TextEditingController _productPrice = new TextEditingController();
  TextEditingController _productDescription = new TextEditingController();

  @override
  void dispose() {
    _productName.dispose();
    _productPrice.dispose();
    _productDescription.dispose();
    super.dispose();
  }

  String validProductName(String value) {
    if (value.isEmpty) {
      return "Producte name can't to be empty";
    }
    return null;
  }

  String validDescription(String value) {
    if (value.isEmpty) {
      return "Description can't to be empty";
    }
    return null;
  }

  String validPrice(String value) {
    if (value.isEmpty) {
      return "Price can't to be empty";
    }
    return null;
  }

  File _file;
  String _url;
  bool _isLoading = false;

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
          child: _isLoading ? _loading(context) : _form(context)),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Column(
          children: [
            buildTextFormField(
                'Enter name of product', 1, _productName, validProductName),
            SizedBox(height: 20),
            buildTextFormField('Enter the product description', 8,
                _productDescription, validDescription),
            SizedBox(height: 20),
            TextFormField(
              controller: _productPrice,
              validator: validPrice,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter the product price per hour',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40),
              ),
              child: DropdownButtonFormField<String>(
                  validator: (newValue) =>
                      newValue == null ? "category can't to be empty" : null,
                  decoration:
                      InputDecoration(isDense: true, border: InputBorder.none),
                  hint: Text('Choose category:'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  style: TextStyle(color: Colors.grey[600], fontSize: 17),
                  value: categorySelect,
                  onChanged: (newValue) {
                    setState(() {
                      categorySelect = newValue;
                    });
                  },
                  items:
                      listcategory.map<DropdownMenuItem<String>>((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList()),
            ),
            SizedBox(height: 20),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: _file == null ? null : Image.file(_file),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: _addProduct,
                      color: Color(0xff6e475b),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'YuseiMagic',
                                  letterSpacing: 1.3)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _addProduct() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });

      FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance.collection("posts").document().setData({
          'product name': _productName.text,
          'product description': _productDescription.text,
          'product praice': _productPrice.text,
          'category': categorySelect,
        }).then((_) {
          Navigator.of(context).pop();
        });
      });
    }
  }

  TextFormField buildTextFormField(
      String myLabel, int lines, TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
      validator: myvalid,
      maxLines: lines,
      decoration: InputDecoration(
        labelText: myLabel,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
