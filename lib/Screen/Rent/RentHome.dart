import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentHome extends StatefulWidget {
  @override
  _RentHomeState createState() => _RentHomeState();
}

class _RentHomeState extends State<RentHome> {
  QuerySnapshot productsList;

  getHomeProducts() async {
    await Firestore.instance
        .collection('products')
        .where('category', isEqualTo: 'Home')
        .getDocuments()
        .then((value) {
      setState(() {
        productsList = value;
      });
    });
  }

  @override
  void initState() {
    getHomeProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          //centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: homeProductsList(context)));
  }

  Widget homeProductsList(BuildContext context) {
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
