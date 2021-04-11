import 'package:flutter/material.dart';

class ProductAdmin extends StatefulWidget {
  @override
  _ProductAdminState createState() => _ProductAdminState();
}

class _ProductAdminState extends State<ProductAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 10.0,
      ),
    );
  }
}
