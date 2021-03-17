import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentGames extends StatefulWidget {
  @override
  _RentGamesState createState() => _RentGamesState();
}

class _RentGamesState extends State<RentGames> {
  // var productsList = [
  //   {'name': 'Speker', 'price': '20', 'image': 'images/speaker.jpg'},
  //   {'name': 'Speker', 'price': '20', 'image': 'images/speaker.jpg'},
  // ];
  QuerySnapshot productsList;

  getGameProducts() async {
    await Firestore.instance
        .collection('posts')
        .where('category', isEqualTo: 'Games')
        .getDocuments()
        .then((value) {
      setState(() {
        productsList = value;
      });
    });
  }

  @override
  void initState() {
    getGameProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Games'),
          //centerTitle: true,
        ),
        body: electroProductsList(context));
  }

  Widget electroProductsList(BuildContext context) {
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
