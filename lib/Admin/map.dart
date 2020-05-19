import 'package:flutter/material.dart';

class MapAdminpanel extends StatefulWidget {
  @override
  _MapAdminpanelState createState() => _MapAdminpanelState();
}

class _MapAdminpanelState extends State<MapAdminpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}