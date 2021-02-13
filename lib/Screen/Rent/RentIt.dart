import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';

class RentIt extends StatefulWidget {
  @override
  _RentItState createState() => _RentItState();
}

class _RentItState extends State<RentIt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent it'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date :',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.date_range,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Time :',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.access_time,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Location:',
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.location_on,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Phone Number:',
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.phone,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                //start rent button
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          color: Color(0xff6e475b),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Rent it',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'YuseiMagic',
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //end rent button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
