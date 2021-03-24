import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    assignOrderToPro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6e475b),
          centerTitle: true,
          title: Text('Orders'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushNamed('Login');
              }),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "New requests ",
                icon: Icon(
                  Icons.assignment_sharp,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "Old Requests",
                icon: Icon(
                  Icons.assignment_turned_in,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            newRequest(context),
            oldRequest(context),
          ],
        ),
      ),
    );
  }

  Widget newRequest(BuildContext context) {
    if (orders == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          itemCount: orders.documents.length,
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
                      Expanded(
                          flex: 1,
                          child: Icon(Icons.time_to_leave_outlined, size: 37)),
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
                                        Text('Description: ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff6e475b))),
                                        Text(
                                            orders.documents[i]
                                                .data['Description']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
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
                                          orders.documents[i].data['Status']
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
              onTap: () {
                Navigator.of(context).pushNamed('ViewOrder');
              },
            );
          });
    }
  }

  Widget oldRequest(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(
                        Icons.done_all,
                        size: 37,
                      ),
                      title: Text('Status Of Request:'),
                      // subtitle: Text('22/2/2021    3:30 PM'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.green[900],
                          child: const Text('DONE'),
                          onPressed: () {},
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Color(0xff6e475b),
                          child: const Text('Pending '),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  QuerySnapshot orders;
  Future assignOrderToPro() async {
    await Firestore.instance
        .collection('detilsPro')
        //.where('AssignOrderTo', isEqualTo: 'uid')
        .where('Status', isEqualTo: 'pending')
        //.orderBy('Date&Time', descending: true)
        .getDocuments()
        .then((value) {
      if (value.documents.isEmpty == true) {
        print('do not have any order now ');
      } else {
        setState(() {
          orders = value;
        });
      }
    });
  }
}
