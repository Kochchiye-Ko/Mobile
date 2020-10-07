import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/inboxTile.dart';
import 'package:kochchiye_ko/Admin/models/inboxob.dart';
import 'package:provider/provider.dart';

class InboxList extends StatefulWidget {
  @override
  _InboxListState createState() => _InboxListState();
}

class _InboxListState extends State<InboxList> {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<Inboxmessage>>(context) ?? [];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return InboxTile(notification: notifications[index]);
      },
    );
  }
}
