import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff6e475b),
            fontFamily: 'YuseiMagic',
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color(0xff6e475b),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      'SUZAN97',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/profilePicture.png'),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildDivider(),
                      ListTile(
                        onTap: () {},
                        leading: Icon(Icons.lock_open_outlined,
                            color: Color(0xff6e475b)),
                        title: Text('change password'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      _buildDivider(),
                      ListTile(
                        onTap: () {},
                        leading:
                            Icon(Icons.location_on, color: Color(0xff6e475b)),
                        title: Text('change Location'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Notification Settings',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6e475b),
                      fontFamily: 'YuseiMagic'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    dense: true,
                    activeColor: Color(0xff6e475b),
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received notification',
                        style: TextStyle(fontSize: 18)),
                    onChanged: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    dense: true,
                    activeColor: Color(0xff6e475b),
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text('Received Offer notification',
                        style: TextStyle(fontSize: 18)),
                    onChanged: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    dense: true,
                    activeColor: Color(0xff6e475b),
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Received Newsletter',
                        style: TextStyle(fontSize: 18)),
                    onChanged: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    dense: true,
                    activeColor: Color(0xff6e475b),
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text('Received App Updates',
                        style: TextStyle(fontSize: 18)),
                    onChanged: null,
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff6e475b), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: 00,
            left: 00,
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                //logout
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
