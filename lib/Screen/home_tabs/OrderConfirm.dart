import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderConfirm extends StatefulWidget {
  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed("home");
          },
        ),
        centerTitle: true,
        title: Text(
          'Order Confirm',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'YuseiMagic'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/orderconfirm.png'))),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Thank you for choosing us!',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Your request will be executed',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
