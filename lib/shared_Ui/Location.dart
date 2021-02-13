import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart' as prefix0;

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String userAddress;
  String manualAddress;
  String userDistrict;

  getLocation() async {
    if (manualAddress == null) {
      print('GetLocation Function in Proccess');
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: prefix0.LocationAccuracy.high);
      debugPrint('location: ${position.latitude}');
      final coordinates =
          new Coordinates(position.latitude, position.longitude);
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
      });
    } else {
      setState(
        () {
          userAddress = manualAddress;
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46.0,
              color: Color(0xff6e475b),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Get User Location',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(''),
            FlatButton(
              onPressed: () {},
              color: Color(0xff6e475b),
              child: Text(
                'Get Current Location ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
