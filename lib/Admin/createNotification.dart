import 'package:flutter/material.dart';

class CreateNotifications extends StatefulWidget {
  @override
  _CreateNotificationsState createState() => _CreateNotificationsState();
}

class _CreateNotificationsState extends State<CreateNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.grey[900],
      ),
      
    );
  }
}