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
        .collection('posts')
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
        body: homeProductsList(context));
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
            image: productsList.documents[i].data['image'].toString(),
          );
        },
      );
    }
  }
}
