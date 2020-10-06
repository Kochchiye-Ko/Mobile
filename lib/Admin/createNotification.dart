import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/createNotificationPanel.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';
import 'package:kochchiye_ko/Admin/inbox/inboxList.dart';
import 'package:kochchiye_ko/Admin/notification.dart';
import 'package:kochchiye_ko/Admin/notiList.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Admin/inboxob.dart';

class CreateNotifications extends StatefulWidget {
  @override
  _CreateNotificationsState createState() => _CreateNotificationsState();
}

class _CreateNotificationsState extends State<CreateNotifications> {
  List<Widget> containers = [
    Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/User/userbgdark.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomRight,
      child: InboxList(),
    ),
    Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/User/userbgdark.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomRight,
      child: NotificationList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<InboxNotification>>.value(
      value: DatabaseService().allNotificationsInbox,
      child: StreamProvider<List<Notifications>>.value(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
      ),
    );
  }
}
