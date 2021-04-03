import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Orders'),
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
              rentRequest(context),
              professionalRequest(context),
            ],
          ),
        ));
  }

  Widget rentRequest(BuildContext context) {
    return
        // Container(
        //   height: 150,
        //   padding: EdgeInsets.all(8.0),
        //   child:
        Column(
      children: [
        Card(
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('images/speaker.jpg'),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.topLeft,
                      height: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20),
                            child: Text("Product name",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff6e475b))),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: Colors.grey,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ],
      //),
    );
  }

  Widget professionalRequest(BuildContext context) {
    return Column(
      children: [
        Card(
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 130,
                    color: Color(0xff6e475b),
                    alignment: Alignment.center,
                    child: Text(
                      'Plumbing',
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
                      height: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: ListTile(
                              title: Text("professional name",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff6e475b))),
                              subtitle: Text('20/4/2021',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 200),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.grey,
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ],
    );
  }
}
