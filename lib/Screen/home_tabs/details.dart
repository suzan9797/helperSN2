import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Container(
        child: Text(''),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: _dateTime,
              use24hFormat: false,
              onDateTimeChanged: (dateTime) {
                print(dateTime);
                setState(() {
                  _dateTime = dateTime;
                });
              },
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
