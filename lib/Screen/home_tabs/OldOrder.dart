import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OldOrder extends StatefulWidget {
  @override
  _OldOrderState createState() => _OldOrderState();
}

class _OldOrderState extends State<OldOrder> {
  @override
  void initState() {
    oldProOrder();
    super.initState();
  }

  QuerySnapshot oldOrders;

  Future oldProOrder() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection('detilsPro')
          .where('AssignOrderTo', isEqualTo: user.uid)
          .where('Status', isEqualTo: 'Canceled')
          .getDocuments()
          .then((value) {
        if (value.documents.isEmpty == true) {
          print('do not have any order now ');
        } else {
          setState(() {
            oldOrders = value;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (oldOrders == null) {
      return Center(child: Text('Dont not have any Old Orders...'));
    } else {
      return ListView.builder(
          itemCount: oldOrders.documents.length,
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
                      Expanded(flex: 1, child: Icon(Icons.done, size: 37)),
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
                                            oldOrders
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
                                          oldOrders.documents[i].data['Status']
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
            );
          });
    }
  }
}
