import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/MyProduct/renterDetails.dart';

class RenterRequst extends StatefulWidget {
  @override
  _RenterRequstState createState() => _RenterRequstState();
}

class _RenterRequstState extends State<RenterRequst> {
  @override
  void initState() {
    getRenterRequst();
    super.initState();
  }

  QuerySnapshot renter;
  Future getRenterRequst() async {
    try {
      await FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('RentOrders')
            .where('RenterId', isEqualTo: user.uid)
            .getDocuments()
            .then((value) {
          if (value.documents.isEmpty == true) {
            print('do not have any products ');
          } else {
            setState(() {
              renter = value;
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

  @override
  Widget build(BuildContext context) {
    if (renter == null) {
      return Center(child: Text('do not have any products')
          //CircularProgressIndicator(),
          );
    } else {
      return ListView.builder(
          itemCount: renter.documents.length,
          itemBuilder: (context, i) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:
                              Image.network(renter.documents[i].data['image']),
                        ),
                        // SizedBox(width: 30),
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
                                    child: ListTile(
                                      title: Text(
                                          renter
                                              .documents[i].data['productName'],
                                          //"professional name",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff6e475b))),
                                      subtitle: Text(
                                          renter.documents[i].data['Date']
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => RenterDetails(
                              renter.documents[i].data['OrderID'])));
                },
              ),
            );
          });
    }
  }
}
