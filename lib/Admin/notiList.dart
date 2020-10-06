import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/notification.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Admin/notification_tile.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<Notifications>>(context) ?? [];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationTile(notification: notifications[index]);
      },
    );
  }
}
