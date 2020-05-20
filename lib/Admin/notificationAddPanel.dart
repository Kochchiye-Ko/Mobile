import 'package:flutter/material.dart';

class NotificationAdd extends StatefulWidget {
  @override
  _NotificationAddState createState() => _NotificationAddState();
}

class _NotificationAddState extends State<NotificationAdd> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration.collapsed(
                    hintText: "Enter your Message here"),
              ),
            ))
      ],
    ));
  }
}
