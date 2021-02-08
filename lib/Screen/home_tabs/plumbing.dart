import 'package:flutter/material.dart';
import 'package:helper/Screen/home_tabs/rating.dart';

class Plumbing extends StatefulWidget {
  @override
  _PlumbingState createState() => _PlumbingState();
}

class _PlumbingState extends State<Plumbing> {
  int _Rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plumbing'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              height: 160,
              width: 100,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset('images/pro.png'),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Abd Al-Rahman',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff925e78),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '7 min away',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Rating(
                                (rating) {
                                  setState(() {
                                    _Rating = rating;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
