import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  String orderID;
  ViewOrder(String orderID) {
    this.orderID = orderID;
  }

  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  QuerySnapshot orderView;
  String orderID;

  @override
  void initState() {
    orderID = widget.orderID;
    getViewOrder();
    super.initState();
  }

  Future getViewOrder() async {
    await Firestore.instance
        .collection('detilsPro')
        .where('orderID', isEqualTo: orderID)
        .getDocuments()
        .then((value) {
      setState(() {
        orderView = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Order'),
          centerTitle: true,
        ),
        body: orders(context));
  }

  Widget orders(BuildContext context) {
    if (orderView == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return ListView.builder(
          itemCount: orderView.documents.length,
          itemBuilder: (context, i) {
            return Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text('Describtion'),
                      subtitle: Text(
                        orderView.documents[i].data['Description'].toString(),
                      ),
                      leading: Icon(Icons.data_usage_outlined),
                    ),
                    ListTile(
                      title: Text('Date & Time '),
                      subtitle: Text(
                        orderView.documents[i].data['Date&Time'].toString(),
                      ),
                      leading: Icon(Icons.date_range),
                    ),
                    ListTile(
                      title: Text('Location '),
                      subtitle: Text(
                        orderView.documents[i].data['Location'].toString(),
                      ),
                      leading: Icon(Icons.location_on),
                    ),
                    ListTile(
                      title: Text('phone Number '),
                      subtitle: Text(
                        orderView.documents[i].data['Phone'].toString(),
                      ),
                      leading: Icon(Icons.call),
                    ),
                    Center(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.red[900],
                            child: const Text('Cancel '),
                            onPressed: () {
                              //if you want to cancel order.
                              Firestore.instance
                                  .collection('detilsPro')
                                  .document(orderView.documents[i].documentID)
                                  .delete()
                                  .then((value) =>
                                      Navigator.of(context).pushNamed('order'));
                            },
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Color(0xff6e475b),
                            child: const Text('Accept'),
                            onPressed: () {
                              //if you want to accept order.
                              Firestore.instance
                                  .collection('detilsPro')
                                  .document(orderView.documents[i].documentID)
                                  .updateData({'Status': 'Acceptable'}).then(
                                      (value) => Navigator.of(context)
                                          .pushNamed('order'));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
