import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';

class DriverHome extends StatefulWidget {
  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Driver Home"),
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
    );
  }
}