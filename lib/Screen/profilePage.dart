import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xff6e475b),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('images/profilePicture.png'),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Suzan79',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'algarousha.s@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'User Information ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff6e475b),
                          fontFamily: 'YuseiMagic'),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Location '),
                    subtitle: Text('Abduallah ,zharaa'),
                    leading: Icon(Icons.location_on),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Email '),
                    subtitle: Text('Algarousha.s@gmail.com'),
                    leading: Icon(Icons.email),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('About Me'),
                    subtitle: Text('Im the best proffestion'),
                    leading: Icon(Icons.info),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
