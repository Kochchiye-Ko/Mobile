import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/inboxob.dart';

class InboxTile extends StatelessWidget {
  final NotificationsInbox notificationsInbox;
  InboxTile({this.notificationsInbox});

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
            notificationsInbox.message1,
            style: TextStyle(color: Colors.blue[800]),
          ),
          subtitle: Text(
            notificationsInbox.dateTime1.toString(),
            style: TextStyle(color: Colors.white, height: 2.0),
          ),
        ),
      ),
    );
  }
}
