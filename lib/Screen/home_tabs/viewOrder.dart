import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Order'),
        centerTitle: true,
      ),
      body: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              // Padding(
              //padding: const EdgeInsets.all(8.0),
              // child: Text(
              //'Suzan Algarousha ',
              //  style: TextStyle(
              //fontWeight: FontWeight.bold,
              // fontSize: 20,
              // color: Color(0xff6e475b),
              // fontFamily: 'YuseiMagic'),
              // ),
              // ),
              Divider(),
              ListTile(
                title: Text('Describtion'),
                subtitle: Text('plese i want to install my bed room today'),
                leading: Icon(Icons.data_usage_outlined),
                onTap: () {},
              ),
              ListTile(
                title: Text('Date & Time '),
                subtitle: Text('22/2/2021    8:44PM '),
                leading: Icon(Icons.date_range),
                onTap: () {},
              ),
              ListTile(
                title: Text('Location '),
                subtitle: Text('AlFiha -Abdalhi Kmal '),
                leading: Icon(Icons.location_on),
                onTap: () {},
              ),
              ListTile(
                title: Text('phone Number '),
                subtitle: Text('0568929550'),
                leading: Icon(Icons.call),
                onTap: () {},
              ),
              Center(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.red[900],
                      child: const Text('Cancel '),
                      onPressed: () {
                        //if you want to cancel order.
                        //Firestore.instance
                        //   .collection('detilspro')
                        // .document(document.documentID)
                        // .delete();
                      },
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0xff6e475b),
                      child: const Text('Accept'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Future assignOrderTo() async {
//  await Firestore.instance
// .collection('detilspro')
/// .where('AssignOrderTo', isEqualTo: 'proID')
//  .where('Date&Time', isLessThanOrEqualTo: DateTime.now())
//.getDocuments();
//}
