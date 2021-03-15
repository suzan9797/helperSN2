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
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  TextEditingController _detilsController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _detilsController.dispose();
    super.dispose();
  }

  String _date = " ";
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
    print(userAddress);
    print(addresses.last.subLocality);
    setState(() {
      userDistrict = addresses.last.subLocality;
      userLocality = first.addressLine;
    });
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
      body: Form(
        key: _key,
        child: ListView(
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
              height: 5,
            ),
            Divider(
              color: Color(0xff6e475b),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.date_range_outlined,
                    size: 30,
                    color: Color(0xff6e475b),
                  ),
                ),
                Text(
                  'Date and Time:',
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 7),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 1.0,
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
                      "  Choose",
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
            SizedBox(height: 10),
            Divider(
              color: Color(0xff6e475b),
            ),
            SizedBox(height: 5),
            Row(
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
                  'Location:',
                  style: TextStyle(color: Colors.grey[800], fontSize: 20),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      userLocality,
                      style: TextStyle(
                        color: Color(0xff6e475b),
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Color(0xff6e475b),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: 350,
                    height: 45,
                    child: RaisedButton(
                      onPressed: _addOrder,
                      color: Color(0xff6e475b),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontFamily: 'YuseiMagic',
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1.3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView();
  }

  Widget _loading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _addOrder() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
    }
  }
}
