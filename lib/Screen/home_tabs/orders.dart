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
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.time_to_leave_outlined,
                      size: 37,
                    ),
                    title: Text('Status Of Request:'),
                    subtitle: Text('22/2/2021    3:30 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red[900],
                        child: const Text('Cancel order'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff6e475b),
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.time_to_leave_outlined,
                      size: 37,
                    ),
                    title: Text('Status Of Request:'),
                    subtitle: Text('2/7/2021    7:30 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red[900],
                        child: const Text('Cancel order'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff6e475b),
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.time_to_leave_outlined,
                      size: 37,
                    ),
                    title: Text('Status Of Request:'),
                    subtitle: Text('2/5/2021    4:30 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red[900],
                        child: const Text('Cancel order'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff6e475b),
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(
                      Icons.time_to_leave_outlined,
                      size: 37,
                    ),
                    title: Text('Status Of Request:'),
                    subtitle: Text('12/8/2021    4:30 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.red[900],
                        child: const Text('Cancel order'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff6e475b),
                        child: const Text('VIEW '),
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

Widget oldRequest(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
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
                    subtitle: Text('22/2/2021    3:30 PM'),
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
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
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
                    subtitle: Text('2/7/2021    7:30 PM'),
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
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
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
                    subtitle: Text('2/5/2021    4:30 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.green[900],
                        child: const Text('Done'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xff6e475b),
                        child: const Text('VIEW '),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
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
                    subtitle: Text('12/8/2021    4:30 PM'),
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
                        child: const Text('VIEW '),
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
