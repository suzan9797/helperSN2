import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helper/Admin/editCategory.dart';

class ProductAdmin extends StatefulWidget {
  @override
  _ProductAdminState createState() => _ProductAdminState();
}

class _ProductAdminState extends State<ProductAdmin> {
  @override
  void initState() {
    getProduct();
    super.initState();
  }

  QuerySnapshot products;
  getProduct() async {
    await Firestore.instance
        .collection('products')
        .getDocuments()
        .then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed("Admin");
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[400],
          elevation: 10.0,
        ),
        body: viewProducts(context));
  }

  Widget viewProducts(BuildContext context) {
    if (products == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          itemCount: products.documents.length,
          itemBuilder: (context, i) {
            return Container(
              height: 180,
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child:
                            Image.network(products.documents[i].data['image'])),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ListTile(
                                title: Text(
                                  products.documents[i].data['product name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff6e475b)),
                                ),
                                subtitle:
                                    Text(products.documents[i].data['category'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        )),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditCategory(products.documents[i]
                                              .data['product ID'])));
                            },
                          ),
                        ))
                  ],
                ),
              ),
            );
          });
    }
  }
}
