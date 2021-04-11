import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RenterDetails extends StatefulWidget {
  String orderID;
  RenterDetails(String orderID) {
    this.orderID = orderID;
  }

  @override
  _RenterDetailsState createState() => _RenterDetailsState();
}

class _RenterDetailsState extends State<RenterDetails> {
  QuerySnapshot orderDetails;
  String orderID;
  void initState() {
    orderID = widget.orderID;
    getOrderDetails();
    super.initState();
  }

  Future getOrderDetails() async {
    await Firestore.instance
        .collection('RentOrders')
        .where('OrderID', isEqualTo: orderID)
        .getDocuments()
        .then((value) {
      setState(() {
        orderDetails = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Renter Details'),
          centerTitle: true,
        ),
        body: userdetails(context));
  }

  Widget userdetails(BuildContext context) {
    if (orderDetails == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: orderDetails.documents.length,
          itemBuilder: (context, i) {
            return Card(
              child: Container(
                height: 400,
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text(
                        'name ',
                      ),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text('phone Number '),
                      subtitle: Text(
                        orderDetails.documents[i].data['Phone'].toString(),
                      ),
                      leading: Icon(Icons.call),
                    ),
                    ListTile(
                      title: Text('Date'),
                      subtitle: Text(
                        orderDetails.documents[i].data['Date'].toString(),
                      ),
                      leading: Icon(Icons.date_range),
                    ),
                    ListTile(
                      title: Text('Time'),
                      subtitle: Text(
                        orderDetails.documents[i].data['Time'].toString(),
                      ),
                      leading: Icon(Icons.access_time),
                    ),
                    ListTile(
                      title: Text('Location '),
                      subtitle: Text(
                        orderDetails.documents[i].data['Location'].toString(),
                      ),
                      leading: Icon(Icons.location_on),
                    ),

                    // Center(
                    //   child: ButtonBar(
                    //     children: <Widget>[
                    //       FlatButton(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(30)),
                    //         color: Colors.red[900],
                    //         child: const Text('Cancel '),
                    //         onPressed: () {
                    //           //if you want to cancel order.
                    //           Firestore.instance
                    //               .collection('detilsPro')
                    //               .document(orderView.documents[i].documentID)
                    //               .updateData({'Status': 'Canceled'}).then(
                    //                   (value) => Navigator.of(context)
                    //                       .pushNamed('order'));
                    //         },
                    //       ),
                    //       FlatButton(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(30)),
                    //         color: Color(0xff6e475b),
                    //         child: const Text('Accept'),
                    //         onPressed: () {
                    //           //if you want to accept order.
                    //           Firestore.instance
                    //               .collection('detilsPro')
                    //               .document(orderView.documents[i].documentID)
                    //               .updateData({'Status': 'Acceptable'}).then(
                    //                   (value) => Navigator.of(context)
                    //                       .pushNamed('order'));
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
