import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/inboxob.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Admin/inbox/inboxTile.dart';

class InboxList extends StatefulWidget {
  @override
  _InboxListState createState() => _InboxListState();
}

class _InboxListState extends State<InboxList> {
  @override
  Widget build(BuildContext context) {
    final notificationsInbox =
        Provider.of<List<InboxNotification>>(context) ?? [];

    return ListView.builder(
      itemCount: notificationsInbox.length,
      itemBuilder: (context, index) {
        return InboxTile(notificationsInbox: notificationsInbox[index]);
      },
    );
  }
}
