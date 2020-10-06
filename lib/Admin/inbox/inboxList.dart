import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/notification.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Admin/inbox/inboxTile.dart';

class InboxList extends StatefulWidget {
  @override
  _InboxListState createState() => _InboxListState();
}

class _InboxListState extends State<InboxList> {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<NotificationsInbox>>(context) ?? [];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return InboxTile(notification: notifications[index]);
      },
    );
  }
}
