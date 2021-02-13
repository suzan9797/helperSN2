import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentHome extends StatefulWidget {
  @override
  _RentHomeState createState() => _RentHomeState();
}

class _RentHomeState extends State<RentHome> {
  var productsList = [
    {
      'name': 'Speker',
      'price': '20',
      'time': 'SR/hours',
      'image': 'images/speaker.jpg'
    },
    {
      'name': 'Speker',
      'price': '20',
      'time': 'SR/hours',
      'image': 'images/speaker.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        //centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, i) {
          return Products(
            name: productsList[i]['name'],
            price: productsList[i]['price'],
            time: productsList[i]['time'],
            image: productsList[i]['image'],
          );
        },
      ),
    );
  }
}