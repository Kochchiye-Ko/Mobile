import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/models/notification/createNotificationPanel.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';
import 'package:kochchiye_ko/Admin/models/notification/notification.dart';
import 'package:kochchiye_ko/Admin/models/notification/notiList.dart';
import 'package:provider/provider.dart';

class CreateNotifications extends StatefulWidget {
  @override
  _CreateNotificationsState createState() => _CreateNotificationsState();
}

class _CreateNotificationsState extends State<CreateNotifications> {
  List<Widget> containers = [
    Container(
      color: Colors.grey[600],
    ),
    Container(
      color: Colors.grey[600],
      alignment: Alignment.bottomRight,
      child: NotificationList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notifications>>.value(
      value: DatabaseService().allNotifications,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Notifications"),
            backgroundColor: Colors.grey[900],
            bottom: TabBar(
              labelColor: Colors.orange,
              tabs: <Widget>[
                Tab(
                  text: 'Inbox',
                ),
                Tab(
                  text: 'Sent',
                )
              ],
            ),
          ),
          backgroundColor: Colors.grey[800],
          body: Stack(
            children: <Widget>[
              TabBarView(children: containers),
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
