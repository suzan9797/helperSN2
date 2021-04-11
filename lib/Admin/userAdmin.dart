import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersAdmin extends StatefulWidget {
  @override
  _UsersAdminState createState() => _UsersAdminState();
}

class _UsersAdminState extends State<UsersAdmin> {
  QuerySnapshot usersAccounts;

  @override
  void initState() {
    getProAccounts();
    super.initState();
  }

  getProAccounts() async {
    await Firestore.instance
        .collection('Users')
        .where('role', isEqualTo: 'User')
        .getDocuments()
        .then((value) {
      setState(() {
        usersAccounts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 10.0,
        title: Text(
          'Users',
          style: TextStyle(
              fontFamily: 'YuseiMagic',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white //((0xff6e475b)),
              ),
        ),
      ),
      body: users(context),
    );
  }

  Widget users(BuildContext context) {
    if (usersAccounts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: usersAccounts.documents.length,
          itemBuilder: (context, i) {
            return InkWell(
              child: Container(
                height: 160,
                width: 100,
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset('images/user.png'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  usersAccounts.documents[i].data['First name']
                                      .toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff925e78),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  usersAccounts.documents[i].data['Email']
                                      .toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff925e78),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red[900],
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        onPressed: () async {
                          await Firestore.instance
                              .collection("Users")
                              .document(usersAccounts.documents[i].documentID)
                              .delete()
                              .then((value) => Navigator.of(context).pop());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
