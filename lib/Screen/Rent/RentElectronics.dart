import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';
import 'package:helper/shared_Ui/Products.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
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
        title: Text('Electronics'),
        //centerTitle: true,
      ),
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
