import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/models/trains.dart';

class TrainsTile extends StatelessWidget {
  final Trains notification;
  TrainsTile({this.notification});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.grey[300].withOpacity(0.5),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.orange[100].withOpacity(0.5),
            backgroundImage: AssetImage('assets/User/train2.png'),
          ),
          title: Text(
            notification.trainNumber,
            style: TextStyle(color: Colors.blue[100]),
          ),
          subtitle: Text(
            notification.trainName.toString(),
            style: TextStyle(color: Colors.white, height: 2.0),
          ),
        ),
      ),
    );
  }
}
