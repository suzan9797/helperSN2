import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  bool _isLoading = false;

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
            SizedBox(height: 50),
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
          'userID': user.uid,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
