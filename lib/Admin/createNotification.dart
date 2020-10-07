// import 'package:flutter/material.dart';
// import 'package:kochchiye_ko/Admin/createNotificationPanel.dart';
// import 'package:kochchiye_ko/Admin/database/database.dart';
// import 'package:kochchiye_ko/Admin/database/database2.dart';
// import 'package:kochchiye_ko/Admin/inbox/inboxList.dart';
// import 'package:kochchiye_ko/Admin/inbox/inboxTile.dart';
// import 'package:kochchiye_ko/Admin/models/notification.dart';
// import 'package:kochchiye_ko/Admin/notiList.dart';
// import 'package:provider/provider.dart';
// import 'package:kochchiye_ko/Admin/models/inboxob.dart';

// class CreateNotifications extends StatefulWidget {
//   @override
//   _CreateNotificationsState createState() => _CreateNotificationsState();
// }

// class _CreateNotificationsState extends State<CreateNotifications> {
//   List<Widget> containers = [
//     Container(
//       decoration: BoxDecoration(
//         image: new DecorationImage(
//           image: new AssetImage("assets/User/userbgdark.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       alignment: Alignment.bottomRight,
//       child: StreamProvider<List<InboxNotification>>.value(
//         value: DatabaseService2().allNotificationsInbox,
//         child: InboxTile(),
//       ),
//     ),
//     Container(
//       decoration: BoxDecoration(
//         image: new DecorationImage(
//           image: new AssetImage("assets/User/userbgdark.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       alignment: Alignment.bottomRight,
//       child: StreamProvider<List<Notifications>>.value(
//         value: DatabaseService().allNotifications,
//         child: NotificationList(),
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Notifications"),
//             backgroundColor: Colors.grey[900],
//             bottom: TabBar(
//               labelColor: Colors.orange,
//               tabs: <Widget>[
//                 Tab(
//                   text: 'Inbox',
//                 ),
//                 Tab(
//                   text: 'Sent',
//                 )
//               ],
//             ),
//           ),
//           backgroundColor: Colors.grey[800],
//           body: Stack(
//             children: <Widget>[
//               TabBarView(children: containers),
//               Container(
//                 alignment: AlignmentDirectional.bottomEnd,
//                 padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CreateNotificationPanel(),
//                       ),
//                     );
//                   },
//                   child: Icon(Icons.add_comment),
//                   backgroundColor: Colors.orange,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/createNotificationPanel.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';
import 'package:kochchiye_ko/Admin/models/notification.dart';
import 'package:kochchiye_ko/Admin/notiList.dart';
import 'package:provider/provider.dart';

class CreateNotifications extends StatefulWidget {
  @override
  _CreateNotificationsState createState() => _CreateNotificationsState();
}

class _CreateNotificationsState extends State<CreateNotifications> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notifications>>.value(
      value: DatabaseService().allNotifications,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sent"),
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
                child: NotificationList(),
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
