import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String categorySelect;
  bool _isLoading = false;
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
      return "Producte name is required";
    }
    return null;
  }

  String validDescription(String value) {
    if (value.isEmpty) {
      return "Description is required";
    }
    return null;
  }

  String validPrice(String value) {
    if (value.isEmpty) {
      return "Price is required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add product'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: _isLoading ? _loading(context) : _form(context)),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Column(
          children: [
            SizedBox(height: 15),
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
                border: OutlineInputBorder(
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
                      newValue == null ? "category is required" : null,
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
            Container(
                margin: EdgeInsets.only(right: 270),
                child: Text('add photo:',
                    style: TextStyle(
                        color: Color(0xff6e475b),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            Container(
              //margin: EdgeInsets.only(left: 250),
              //color: Colors.black,
              height: 120,
              width: 120,
              child: Center(
                child: _file == null
                    ? IconButton(
                        icon: Icon(Icons.add_a_photo, size: 30),
                        onPressed: () {
                          _showChoiceDialog(context);
                        })
                    : Image.file(_file),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    RaisedButton(
                      //onPressed: _addProduct,
                      onPressed: () {
                        uploadImage(context);
                      },
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
      child: Text(
        'please signIn if you want to add product..',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff6e475b),
            fontFamily: 'YuseiMagic'),
      ),
    );
  }

  final docId = Firestore.instance.collection("products").document().documentID;

  Future addProduct() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });

      await FirebaseAuth.instance.currentUser().then((user) async {
        await Firestore.instance
            .collection("products")
            .document(docId)
            .setData({
          'product name': _productName.text,
          'product description': _productDescription.text,
          'product praice': _productPrice.text,
          'category': categorySelect,
          'userID': user.uid,
          "image": imgURL,
          'product ID': docId,
        }).then((_) {
          Navigator.of(context).pop();
        });
      });
    }
  }

  File _file;
  String imgURL;
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
        imgURL = url;
      });
      addProduct().then((val) {
        Navigator.of(context).pushNamed('home');
      });
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Make a Choice!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    // SizedBox(height: 8),
                    Divider(
                      color: Color(0xff6e475b),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      child: Text('Gallery', style: TextStyle(fontSize: 18)),
                      onTap: () {
                        pickerGallery(context);
                      },
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: Color(0xff6e475b),
                    ),
                    SizedBox(height: 8),
                    //Padding(padding: EdgeInsets.all(8)),
                    GestureDetector(
                      child: Text('Camera', style: TextStyle(fontSize: 18)),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
