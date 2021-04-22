import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  String productID;
  EditCategory(String productID) {
    this.productID = productID;
  }
  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  @override
  void initState() {
    productID = widget.productID;
    getCategory();
    super.initState();
  }

  String categorySelect;

  List listcategory = ['Electronics', 'Games', 'Home', 'Tools', 'Other'];
  QuerySnapshot category;
  String productID;
  getCategory() async {
    await Firestore.instance
        .collection('products')
        .where('product ID', isEqualTo: productID)
        .getDocuments()
        .then((value) {
      setState(() {
        category = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Edit Category'),
          centerTitle: true,
          backgroundColor: Colors.grey[400],
          elevation: 10.0,
        ),
        body: chooseCategory(context));
  }

  Widget chooseCategory(BuildContext context) {
    if (category == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: category.documents.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 300),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            isDense: true, border: InputBorder.none),
                        hint: Text(category.documents[i].data['category']),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff6e475b),
                        ),
                        iconSize: 35,
                        style: TextStyle(color: Colors.grey[600], fontSize: 17),
                        value: categorySelect,
                        onChanged: (newValue) {
                          setState(() {
                            categorySelect = newValue;
                          });
                        },
                        items: listcategory
                            .map<DropdownMenuItem<String>>((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
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
                              if (categorySelect == null) {
                                //do nothing
                              } else {
                                await Firestore.instance
                                    .collection('products')
                                    .document(category.documents[i].documentID)
                                    .updateData({'category': categorySelect});
                                Navigator.pushReplacementNamed(
                                    context, 'productAdmin');
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
              ),
            );
          });
    }
  }
}
