import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/productsDetails.dart';

class Products extends StatelessWidget {
  final name;
  final price;
  final image;
  final productID;
  Products({this.name, this.price, this.image, this.productID});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 130,
        child: Card(
            elevation: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: image,
                  // Image.asset('images/speaker.jpg'),
                ),
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
                            margin: EdgeInsets.only(top: 30, left: 20),
                            child: Text(name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff6e475b))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(price,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.blue)),
                                SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text('SR/hours',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600])),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProductsDetails(productID)));
        // Navigator.of(context).pushNamed('productsDetails');
      },
    );
  }
}
