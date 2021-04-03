import 'package:flutter/material.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Products'),
      ),
    );
  }
}
