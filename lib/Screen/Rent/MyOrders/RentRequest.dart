import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RentRequest extends StatefulWidget {
  @override
  _RentRequestState createState() => _RentRequestState();
}

class _RentRequestState extends State<RentRequest> {
  @override
  void initState() {
    getMyProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (rentOrders == null) {
      return Center(child: Text('do not have any products')
          //CircularProgressIndicator(),
          );
    } else {
      return ListView.builder(
          itemCount: rentOrders.documents.length,
          itemBuilder: (context, i) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(
                              rentOrders.documents[i].data['image'])),
                      Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.topLeft,
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 30, left: 20),
                                  child: Text(
                                      rentOrders
                                          .documents[i].data['productName'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff6e475b))),
                                ),
                                ButtonBar(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      color: Colors.grey,
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  )),
            );
          });
    }
  }

  QuerySnapshot rentOrders;
  Future getMyProducts() async {
    try {
      await FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('RentOrders')
            .where('userID', isEqualTo: user.uid)
            .getDocuments()
            .then((value) {
          if (value.documents.isEmpty == true) {
            print('do not have any products ');
          } else {
            setState(() {
              rentOrders = value;
            });
          }
        });
      });
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }
}
