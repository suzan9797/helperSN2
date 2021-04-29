import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/MyOrders/Evaluation.dart';
import 'package:helper/Screen/Rent/MyOrders/RentRequest.dart';

class UserOrders extends StatefulWidget {
  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  void initState() {
    getProfessionalRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Orders'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed("home");
              },
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Rent request",
                ),
                Tab(
                  text: "Professional request",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // rentRequest(context),
              RentRequest(),
              professionalRequest(context),
            ],
          ),
        ));
  }

  Widget professionalRequest(BuildContext context) {
    if (proRequest == null) {
      return Center(child: Text('do not have any products')
          //CircularProgressIndicator(),
          );
    } else {
      return ListView.builder(
          itemCount: proRequest.documents.length,
          itemBuilder: (context, i) {
            return Container(
              child: Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          color: Color(0xff6e475b),
                          alignment: Alignment.center,
                          child: Text(
                            proRequest.documents[i].data['Status'],
                            //'Plumbing',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: ListTile(
                                    title: Text(
                                        proRequest.documents[i].data['proName'],
                                        //"professional name",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff6e475b))),
                                    subtitle: Text(
                                        proRequest
                                            .documents[i].data['Date&Time']
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 100),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.grey,
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          Firestore.instance
                                              .collection('detilsPro')
                                              .document(proRequest
                                                  .documents[i].documentID)
                                              .delete()
                                              .then((value) =>
                                                  Navigator.of(context).pop());
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.green,
                                        child: const Text(
                                          'Done',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          Firestore.instance
                                              .collection('detilsPro')
                                              .document(proRequest
                                                  .documents[i].documentID)
                                              .delete()
                                              .then((value) => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Evaluation(proRequest
                                                                  .documents[i]
                                                                  .data[
                                                              'AssignOrderTo']))));
                                        },
                                      ),
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

  QuerySnapshot proRequest;
  Future getProfessionalRequest() async {
    try {
      await FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance
            .collection('detilsPro')
            .where('OrderFrom', isEqualTo: user.uid)

            //.where('Status', isEqualTo: 'pending')
            .getDocuments()
            .then((value) {
          if (value.documents.isEmpty == true) {
            print('do not have any request ');
          } else {
            setState(() {
              proRequest = value;
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
