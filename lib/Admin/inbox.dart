import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/createNotificationPanel.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';
import 'package:kochchiye_ko/Admin/inboxList.dart';
import 'package:kochchiye_ko/Admin/models/inboxob.dart';
import 'package:provider/provider.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Inboxmessage>>.value(
      value: DatabaseService().getInboxmessages,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Inbox"),
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.grey[800],
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/User/userbgdark.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: InboxList(),
              ),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNotificationPanel(),
                      ),
                    );
                  },
                  child: Icon(Icons.add_comment),
                  backgroundColor: Colors.orange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
