import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';

class ProductsDetails extends StatefulWidget {
  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            //start header page
            Container(
              height: 350,
              child: GridTile(
                child: Image.asset('images/speaker.jpg'),
                footer: Container(
                    height: 40,
                    color: Colors.black.withOpacity(0.3),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Speaker',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            '20 SR/hours',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            //end header page
            SizedBox(height: 10),
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
            //start column description
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
                            text:
                                'Take your tunes on the go with the powerful JBL Flip 5. Our lightweight Bluetooth speaker goes anywhere. Bad weather? Not to worry. With its waterproof design, you can rock out to our signature sound rain or shine. Move more. Pair two JBL PartyBoost-compatible speakers together for stereo sound or link multiple JBL PartyBoost-compatible speakers to create a bigger party. Enjoy up to 12 hours of play time for your favorite music. Stand it vertical or horizontal and be bold with your choice of 11 vibrant colors.',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
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
                        Navigator.of(context).pushNamed('RentIt');
                      },
                      color: Color(0xff6e475b),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
        ));
  }
}
