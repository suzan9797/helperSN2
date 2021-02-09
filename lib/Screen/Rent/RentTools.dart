import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentTools extends StatefulWidget {
  @override
  _RentToolsState createState() => _RentToolsState();
}

class _RentToolsState extends State<RentTools> {
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
        title: Text('Tools'),
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
