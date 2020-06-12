import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
      ),
    );
  }
}