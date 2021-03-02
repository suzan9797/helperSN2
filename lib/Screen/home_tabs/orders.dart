import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff6e475b),
      home: DefaultTabController(
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
      ),
    );
  }
}

Widget newRequest(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
        child: Container(
          height: 120,
          width: 150,
          child: Card(
            elevation: 14,
            child: Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      '  Date and Time:',
                      style: TextStyle(color: Colors.grey[800], fontSize: 17),
                    ),
                    Text(
                      '  Status of Requsts: ',
                      style: TextStyle(color: Colors.grey[800], fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget oldRequest(BuildContext context) {
  return Container();
}
