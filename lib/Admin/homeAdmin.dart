import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Home ',
          style: TextStyle(
              color: Color((0xff6e475b)),
              fontSize: 22,
              fontFamily: 'YuseiMagic',
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              InkWell(
                child: GridTile(
                  child: Image.asset('images/Worker.png'),
                  footer: Container(
                    child: Text(
                      'Proffestion',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'YuseiMagic',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color((0xff6e475b)),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("ProAdmin");
                },
              ),
              InkWell(
                child: GridTile(
                  child: Image.asset(
                    'images/user.png',
                  ),
                  footer: Container(
                    child: Text(
                      'Users',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'YuseiMagic',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color((0xff6e475b)),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('UsersAdmin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
