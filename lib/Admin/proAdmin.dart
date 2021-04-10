import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProAdmin extends StatefulWidget {
  @override
  _ProAdminState createState() => _ProAdminState();
}

class _ProAdminState extends State<ProAdmin> {
  QuerySnapshot proAccounts;

  @override
  void initState() {
    getProAccounts();
    super.initState();
  }

  getProAccounts() async {
    await Firestore.instance
        .collection('Users')
        .where('role', isEqualTo: 'Professional Account')
        .getDocuments()
        .then((value) {
      setState(() {
        proAccounts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.white,

        title: Text(
          'Proffestion',
          style: TextStyle(
              fontFamily: 'YuseiMagic',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white //((0xff6e475b)),
              ),
        ),
      ),
      body: proffestion(context),
    );
  }

  Widget proffestion(BuildContext context) {
    if (proAccounts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: proAccounts.documents.length,
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
                        child: Image.asset('images/Worker.png'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  proAccounts.documents[i].data['Full name']
                                      .toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff925e78),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  proAccounts.documents[i].data['Profession']
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
                              .document(proAccounts.documents[i].documentID)
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
