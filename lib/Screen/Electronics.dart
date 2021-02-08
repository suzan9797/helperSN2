import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  var electronicList = [
    {'name': 'Speker', 'price': '20', 'time': 'SR/hours'},
    {'name': 'Speker', 'price': '20', 'time': 'SR/hours'},
    {'name': 'Speker', 'price': '20', 'time': 'SR/hours'},
    {'name': 'Speker', 'price': '20', 'time': 'SR/hours'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics'),
        //centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: electronicList.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              height: 100,
              width: 100,
              child: Card(
                  child: Row(
                children: [
                  Expanded(
                      flex: 1, child: Image.asset('images/electronics.png')),
                  Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.topLeft,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(electronicList[i]['name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff925e78))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(electronicList[i]['price'],
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue)),
                                  Text(electronicList[i]['time'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600])),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ],
              )),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
