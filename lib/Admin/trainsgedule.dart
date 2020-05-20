import 'package:flutter/material.dart';

class TrainShedule extends StatefulWidget {
  @override
  TrainSheduleState createState() => TrainSheduleState();
}

class TrainSheduleState extends State<TrainShedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Train Schedule"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}