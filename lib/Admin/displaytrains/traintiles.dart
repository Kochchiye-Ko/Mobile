import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/models/trains.dart';

class TrainsTile extends StatelessWidget {
  final Trains trains;
  TrainsTile({this.trains});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.grey[300],
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.orange[300],
            backgroundImage: AssetImage('assets/adminicons/ps.png'),
          ),
          title: Text(trains.trainName),
        ),
      ),
    );
  }
}
