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

  // List<String> userName;
  // Future getUserName(QuerySnapshot orders) async {
  //   for (int i = 0; i < orders.documents.length; i) {
  //     await Firestore.instance
  //         .collection('Users')
  //         .document(orders.documents[i].data['UserID'])
  //         .get()
  //         .then((value) {
  //       userName.add(value.data['First name']);
  //     });
  //   }
  // }

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
      //  getUserName(orderDetails);
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
                        // orderDetails.documents[i].data['First name'].toString(),
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
                  ],
                ),
              ),
            );
          });
    }
  }
}
