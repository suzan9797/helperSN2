import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/Screen/Rent/RentIt.dart';

class ProductsDetails extends StatefulWidget {
  String productID;
  ProductsDetails(String productID) {
    this.productID = productID;
  }
  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  QuerySnapshot productDetails;
  String productID;
  @override
  void initState() {
    productID = widget.productID;
    getProductsDetails();
    super.initState();
  }

  getProductsDetails() async {
    await Firestore.instance
        .collection('products')
        .where('product ID', isEqualTo: productID)
        .getDocuments()
        .then((value) {
      setState(() {
        productDetails = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        body: detals(context));
  }

  Widget detals(BuildContext context) {
    if (productDetails == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          itemCount: productDetails.documents.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Container(
                  height: 350,
                  child: GridTile(
                    child: Image.network(
                        productDetails.documents[i].data['image']),
                    footer: Container(
                        height: 40,
                        color: Colors.black.withOpacity(0.3),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  productDetails
                                      .documents[i].data['product name']
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      productDetails
                                          .documents[i].data['product praice']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      ' SR/hours',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                  ),
                ),
                //end header page
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6e475b)),
                      ),
                    ),
                  ],
                ),
                //start column description  product description
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: productDetails
                                    .documents[i].data['product description']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
                //end column description
                SizedBox(height: 30),
                //start rent button
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => RentIt(
                                    productDetails.documents[i].data['userID']
                                        .toString(),
                                    productDetails
                                        .documents[i].data['product name']
                                        .toString(),
                                    productDetails.documents[i].data['image']),
                              ),
                            );

                            //Navigator.of(context).pushNamed('RentIt');
                          },
                          color: Color(0xff6e475b),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Rent it',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'YuseiMagic',
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //end rent button
              ],
            );
          });
    }
  }
}
