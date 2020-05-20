import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNotifications extends StatefulWidget {
  @override
  _CreateNotificationsState createState() => _CreateNotificationsState();
}

class _CreateNotificationsState extends State<CreateNotifications> {
  Future<String> createPopup(BuildContext context) {
    TextEditingController customcontroller = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create Notifocation"),
            content: Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: customcontroller,
                  maxLines: 5,
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter your Message here"),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton.icon(
                label: new Text(
                  " Send",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                icon: Icon(
                  Icons.send,
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pop(customcontroller.text.toString());
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        child: FloatingActionButton(
          onPressed: () {
            createPopup(context).then((onValue) {
              print("object");
              SnackBar(content: null)
              // SnackBar mySnackbar = SnackBar(content: Text("data $onValue" ));
              // Scaffold.of(context).showSnackBar(mySnackbar);
            });
          },
          child: Icon(Icons.add_comment),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
