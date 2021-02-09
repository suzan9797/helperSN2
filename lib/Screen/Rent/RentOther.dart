import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';
import 'package:helper/shared_Ui/Products.dart';

class RentOther extends StatefulWidget {
  @override
  _RentOtherState createState() => _RentOtherState();
}

class _RentOtherState extends State<RentOther> {
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
        title: Text('Other'),
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
