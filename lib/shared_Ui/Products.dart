import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final name;
  final price;
  final time;
  final image;
  Products({this.name, this.price, this.time, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
            child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset('images/speaker.jpg')),
            //SizedBox(width: 8),
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
                        child: Text(name,
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
                            Text(price,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue)),
                            SizedBox(width: 2),
                            Text(time,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600])),
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
  }
}
