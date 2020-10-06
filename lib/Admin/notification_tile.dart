import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/notification.dart';

class NotificationTile extends StatelessWidget {
  final Notifications notification;
  NotificationTile({this.notification});

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
            backgroundColor: Colors.orange[300].withOpacity(0.5),
            backgroundImage: AssetImage('assets/adminicons/ps.png'),
          ),
          title: Text(
            notification.message,
            style: TextStyle(color: Colors.blue[800]),
          ),
          subtitle: Text(
            notification.dateTime.toString(),
            style: TextStyle(color: Colors.blueGrey, height: 2.0),
          ),
        ),
      ),
    );
  }
}
