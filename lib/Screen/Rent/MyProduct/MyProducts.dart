import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/MyProduct/RenterRequest.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  void initState() {
    getMyProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Products'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "My Products"),
              Tab(text: "Renter Requests"),
            ],
          ),
        ),
        body: TabBarView(
          children: [myProducts(context), RenterRequst()],
        ),
      ),
    );
  }

  Widget myProducts(BuildContext context) {
    if (products == null) {
      return Center(child: Text('do not have any products')
          //CircularProgressIndicator(),
          );
    } else {
      return ListView.builder(
          itemCount: products.documents.length,
          itemBuilder: (context, i) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                            Image.network(products.documents[i].data['image']),
                      ),
                      Expanded(
                        flex: 3,
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
                                      products.documents[i].data['product name']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 17,
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
                                      color: Colors.red[900],
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      onPressed: () async {
                                        await Firestore.instance
                                            .collection("products")
                                            .document(products
                                                .documents[i].documentID)
                                            .delete()
                                            .then((value) =>
                                                Navigator.of(context).pop());
                                      },
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

  QuerySnapshot products;
  Future getMyProducts() async {
    try {
      await FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('products')
            .where('userID', isEqualTo: user.uid)
            .getDocuments()
            .then((value) {
          if (value.documents.isEmpty == true) {
            print('do not have any products ');
          } else {
            setState(() {
              products = value;
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
