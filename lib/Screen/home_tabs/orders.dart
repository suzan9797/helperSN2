import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helper/Screen/home_tabs/drawerOfPro.dart';
import 'package:helper/Screen/home_tabs/viewOrder.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    assignOrderToPro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6e475b),
        centerTitle: true,
        title: Text('Orders'),
      ),
      drawer: DrawerPro(),
      body: newRequest(context),
    );
  }

  Widget newRequest(BuildContext context) {
    if (newOrders == null) {
      return Center(child: Text('Dont not have any Orders...'));
    } else {
      return ListView.builder(
          itemCount: newOrders.documents.length,
          itemBuilder: (context, i) {
            return InkWell(
              child: Container(
                height: 150,
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  color: Colors.grey.shade200,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(Icons.time_to_leave_outlined, size: 37)),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text('Date & Time: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff6e475b))),
                                        Text(
                                            newOrders
                                                .documents[i].data['Date&Time']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Status:  ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff6e475b),
                                          ),
                                        ),
                                        Text(
                                          newOrders.documents[i].data['Status']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ViewOrder(newOrders.documents[i].data['orderID'])));
              },
            );
          });
    }
  }

  QuerySnapshot newOrders;
  Future assignOrderToPro() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('detilsPro')
          .where('AssignOrderTo', isEqualTo: user.uid)
          //.where('Status', arrayContainsAny: ['pending', 'Acceptable'])
          //.where('Status', isEqualTo: 'pending')

          //.orderBy('Date&Time', descending: true)
          .getDocuments()
          .then((value) {
        if (value.documents.isEmpty == true) {
          print('do not have any order now ');
        } else {
          setState(() {
            newOrders = value;
          });
        }
      });
    });
  }
}
