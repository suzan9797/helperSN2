import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentTools extends StatefulWidget {
  @override
  _RentToolsState createState() => _RentToolsState();
}

class _RentToolsState extends State<RentTools> {
  QuerySnapshot productsList;

  getToolProducts() async {
    await Firestore.instance
        .collection('products')
        .where('category', isEqualTo: 'Tools')
        .getDocuments()
        .then((value) {
      setState(() {
        productsList = value;
      });
    });
  }

  @override
  void initState() {
    getToolProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tools'),
          //centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: toolProductsList(context)));
  }

  Widget toolProductsList(BuildContext context) {
    if (productsList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: productsList.documents.length,
        itemBuilder: (context, i) {
          return Products(
            name: productsList.documents[i].data['product name'].toString(),
            price: productsList.documents[i].data['product praice'].toString(),
            image: Image.network(productsList.documents[i].data['image']),
            productID: productsList.documents[i].data['product ID'].toString(),
          );
        },
      );
    }
  }
}
