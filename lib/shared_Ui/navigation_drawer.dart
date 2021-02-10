import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('SUZAN97'),
            accountEmail: Text('algarousha.s@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Color(0xff6e475b),
            ),
            decoration: BoxDecoration(color: Color(0xff925e78)),
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Gategory'),
              semanticsLabel: ('MY Order'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.home_repair_service_sharp,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {},
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Home Page'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.home,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('home');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Favorite Persons'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.how_to_reg_rounded,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {},
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Login'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.login,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('Login');
            },
          ),
          ListTile(
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            title: Text(
              ('Setting'),
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.settings,
              color: Color(0xff6e475b),
              size: 25,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
