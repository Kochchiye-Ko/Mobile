import 'package:flutter/material.dart';

class UsersAdminpanel extends StatefulWidget {
  @override
  _UsersAdminpanelState createState() => _UsersAdminpanelState();
}

class _UsersAdminpanelState extends State<UsersAdminpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}