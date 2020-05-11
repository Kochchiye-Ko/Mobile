import 'package:background_location/background_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:kochchiye_ko/Admin/Admin.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';
import 'package:kochchiye_ko/User/User.dart';

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  Geoflutterfire geo = Geoflutterfire();
    final AuthService _auth = AuthService();

  getaa() async {
    BackgroundLocation.startLocationService();
    BackgroundLocation.getLocationUpdates((location) {
      GeoFirePoint point =
          geo.point(latitude: location.latitude, longitude: location.longitude);
      Firestore.instance
          .collection('trainlocations')
          .document('train3')
          .setData({'position': point.data});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Home"),
        actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: new Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              RaisedButton(
                child: Text("Go to UserHome"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userhome()),
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Go to Adminhome"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Adminhome()),
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Start send location"),
                onPressed: () {
                  getaa();
                },
              ),
              RaisedButton(
                child: Text("Stop send location"),
                onPressed: () {
                  BackgroundLocation.stopLocationService();
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Stop send location"),
                onPressed: () {
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  Signin()
                  //   ),
                  // );
                },
              ),
              Text(
                  "All of these are in testing mode to tese]t.UI's will be added leter")
            ]),
          )
        ],
      ),
    );
  }
}
