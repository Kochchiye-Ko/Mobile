import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/models/notification.dart';

class NotificationTile extends StatelessWidget {
  final Notifications notification;
  NotificationTile({this.notification});

  @override
  Widget build(BuildContext context) {
    if (notification.toaccount == "to_all") {
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: Colors.grey[300],
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.orange[500],
              backgroundImage: AssetImage('assets/adminicons/al.png'),
            ),
            title: Text(notification.message),
            subtitle: Text(
              notification.dateTime.toDate().toString(),
              style: TextStyle(color: Colors.blueGrey, height: 2.0),
            ),
          ),
        ),
      );
    } else if (notification.toaccount == "to_drivers") {
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: Colors.grey[300],
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.orange[400],
              backgroundImage: AssetImage('assets/adminicons/tr.png'),
            ),
            title: Text(notification.message),
            subtitle: Text(
              notification.dateTime.toDate().toString(),
              style: TextStyle(color: Colors.blueGrey, height: 2.0),
            ),
          ),
        ),
      );
    } else {
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
            title: Text(notification.message),
            subtitle: Text(
              notification.dateTime.toDate().toString(),
              style: TextStyle(color: Colors.blueGrey, height: 2.0),
            ),
          ),
        ),
      );
    }
  }
}
