import 'package:flutter/material.dart';

class DriversAdminpanel extends StatefulWidget {
  @override
  _DriversAdminpanelState createState() => _DriversAdminpanelState();
}

class _DriversAdminpanelState extends State<DriversAdminpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drivers"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}