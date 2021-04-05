import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentOther extends StatefulWidget {
  @override
  _RentOtherState createState() => _RentOtherState();
}

class _RentOtherState extends State<RentOther> {
  QuerySnapshot productsList;

  getOtherProducts() async {
    await Firestore.instance
        .collection('products')
        .where('category', isEqualTo: 'Other')
        .getDocuments()
        .then((value) {
      setState(() {
        productsList = value;
      });
    });
  }

  @override
  void initState() {
    getOtherProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Other'),
          //centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: otherProductsList(context)));
  }

  Widget otherProductsList(BuildContext context) {
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
