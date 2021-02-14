import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart' as prefix0;

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String _date = "Choose the Date";
  String userAddress;
  String manualAddress;
  String userDistrict;
  String userLocality = '  ';

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: prefix0.LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    debugPrint('long= ' + position.longitude.toString());
    final coordinates = new Coordinates(position.latitude, position.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
  }

  Widget _buildDescribtion() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter your Describtion',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        maxLines: 8,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text(
              'Description of your Service:',
              style: TextStyle(
                color: Color(0xff6e475b),
                fontSize: 19,
                fontFamily: 'YuseiMagic',
              ),
            ),
          ),
          _buildDescribtion(),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 4.0,
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  theme: DatePickerTheme(
                      containerHeight: 210.0,
                      backgroundColor: Colors.white,
                      headerColor: Colors.white,
                      cancelStyle: TextStyle(color: Colors.grey),
                      doneStyle: TextStyle(color: Colors.red),
                      itemStyle: TextStyle(color: Colors.black)),
                  showTitleActions: true,
                  minTime: DateTime(2020, 1, 1),
                  maxTime: DateTime(2021, 10, 30), onConfirm: (date) {
                print('confirm $date');
                _date = '${date.day} / ${date.month} / ${date.year}  ' +
                    DateFormat.jm().format(date);
                setState(() {});
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              size: 18.0,
                              color: Color(0xff6e475b),
                            ),
                            Text(
                              " $_date",
                              style: TextStyle(
                                  color: Color(0xff6e475b),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "  Change",
                    style: TextStyle(
                        color: Color(0xff6e475b),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
            color: Colors.white,
          ),
          SizedBox(height: 25),
          Text(
            'Location:',
            style: TextStyle(color: Colors.grey[800], fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: Color(0xff6e475b),
                ),
              ),
              Text(
                userLocality,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: RaisedButton(
                    color: Color(0xff6e475b),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          fontFamily: 'YuseiMagic',
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.3),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
