import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us...'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/bg2.png'))),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Helper application that counts areas that benefit to User and Professionals',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              '1-You can rent from your home',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              '2-You can request the professional and professional you need.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'We strive to fulfil all your needs and promise to provide the best services to your homes.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
