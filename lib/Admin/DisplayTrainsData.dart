import 'package:flutter/material.dart';

class DisplayTrainsData extends StatefulWidget {
  @override
  _DisplayTrainsDataState createState() => _DisplayTrainsDataState();
}

class _DisplayTrainsDataState extends State<DisplayTrainsData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Train List"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}