import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart' as prefix0;

class RentIt extends StatefulWidget {
  String renterID;
  String productName;
  String image;
  RentIt(String renterID, String productName, String image) {
    this.renterID = renterID;
    this.productName = productName;
    this.image = image;
  }
  @override
  _RentItState createState() => _RentItState();
}

class _RentItState extends State<RentIt> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();

  TextEditingController phoneController = new TextEditingController();

  String dateSelected = '';
  String timeSelected = '';
  String userAddress;
  String manualAddress;
  String userDistrict;
  String userLocality = '  ';

  bool _isLoading = false;

  String validPhone(String val) {
    if (val.isEmpty) {
      return "Phone number is required";
    }
    if (val.length != 10) {
      return "Enter valid phone";
    }
    return null;
  }

  String renterID;
  String productName;
  String image;
  @override
  void initState() {
    renterID = widget.renterID;
    productName = widget.productName;
    image = widget.image;
    getLocation();
    super.initState();
  }

  getLocation() async {
    print('GetLocation Function in Proccess');
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: prefix0.LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    userAddress = 'https://www.google.com/maps/search/?api=1&query=' +
        position.latitude.toString() +
        ',' +
        position.longitude.toString();
    print("${first.featureName} : ${first.addressLine}");
    print('https://www.google.com/maps/search/?api=1&query=' +
        position.latitude.toString() +
        ',' +
        position.longitude.toString());
    setState(() {
      userDistrict = addresses.last.subLocality;
      userLocality = first.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rent it'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(25),
            child: _isLoading ? _loading(context) : _form(context)));
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date :',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            InkWell(
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.date_range,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    hintText: '  ' + dateSelected,
                    hintStyle: TextStyle(color: Color(0xff6e475b))),
              ),
              onTap: () {
                DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                        containerHeight: 210.0,
                        backgroundColor: Colors.white,
                        headerColor: Colors.white,
                        cancelStyle: TextStyle(color: Colors.grey),
                        doneStyle: TextStyle(color: Colors.red),
                        itemStyle: TextStyle(color: Colors.black)),
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2022, 10, 30), onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    dateSelected =
                        '${date.day} / ${date.month} / ${date.year}  ';
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
            ),
            SizedBox(height: 25),
            Text(
              'Time :',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            InkWell(
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.access_time_outlined,
                        size: 30,
                        color: Color(0xff6e475b),
                      ),
                    ),
                    hintText: '  ' + timeSelected,
                    hintStyle: TextStyle(color: Color(0xff6e475b))),
              ),
              onTap: () {
                DatePicker.showTimePicker(context,
                    theme: DatePickerTheme(
                        containerHeight: 210.0,
                        backgroundColor: Colors.white,
                        headerColor: Colors.white,
                        cancelStyle: TextStyle(color: Colors.grey),
                        doneStyle: TextStyle(color: Colors.red),
                        itemStyle: TextStyle(color: Colors.black)),
                    showTitleActions: true, onConfirm: (time) {
                  setState(() {
                    timeSelected = DateFormat.jm().format(time);
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
            ),
            SizedBox(height: 25),
            Text(
              'Location:',
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Color(0xff6e475b),
                    ),
                  ),
                  hintText: userLocality,
                  hintStyle: TextStyle(color: Color(0xff6e475b))),
            ),
            SizedBox(height: 25),
            Text(
              'Phone Number:',
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            TextFormField(
              validator: validPhone,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.phone,
                    size: 30,
                    color: Color(0xff6e475b),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            //start rent button
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: _addOrder,
                      color: Color(0xff6e475b),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
        ),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(
      child: Text(
        'please signIn if you want to renting...',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color(0xff6e475b),
            fontFamily: 'YuseiMagic'),
      ),
    );
  }

  final docId =
      Firestore.instance.collection("RentOrders").document().documentID;
  void _addOrder() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });

      FirebaseAuth.instance.currentUser().then((user) {
        Firestore.instance.collection("RentOrders").document(docId).setData({
          'Date': dateSelected,
          'Time': timeSelected,
          'Location': userLocality,
          'Phone': phoneController.text,
          'userID': user.uid,
          'RenterId': renterID,
          'image': image,
          'productName': productName,
          'OrderID': docId
        }).then((_) {
          Navigator.of(context).pop();
        });
      });
    }
  }
}
