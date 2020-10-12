// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:easy_localization/easy_localization.dart';

// class UserProfile extends StatefulWidget {
//   @override
//   _UserProfileState createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userlocation();
//     var androids = new AndroidInitializationSettings('app_icon');
//     var initial = new InitializationSettings(android: androids);
//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.initialize(initial,
//         onSelectNotification: notifyme);
//   }

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   Position position;
//   userlocation() async {
//     LocationPermission permission = await requestPermission();
//     position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }

//   StreamSubscription<QuerySnapshot> subscription;
//   List<DocumentSnapshot> snapshot;
//   Query collectionReference = Firestore.instance
//       .collection("trainlocations")
//       .where("Train Name", isEqualTo: "Yal devi");

//   @override
//   Widget build(BuildContext context) {
//     Future showNotification(String name, index, type) async {
//       print(index);
//       var details = new AndroidNotificationDetails(
//           index.toString(), "Desi", "THis ",
//           importance: Importance.max,
//           priority: Priority.high,
//           ongoing: true,
//           autoCancel: true);
//       var generatenotiofication = new NotificationDetails(android: details);

//       await flutterLocalNotificationsPlugin.show(
//           index,
//           type + " Notice",
//           name +
//               " Has an emergency breakdown.\nSee notification for more details ",
//           generatenotiofication);
//     }

//     ScreenUtil.init(height: 896, width: 414, allowFontScaling: true);
//     var userprofile = Expanded(
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 100,
//             width: 100,
//             margin: EdgeInsets.only(top: 30),
//             child: Stack(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage("assets/User/avatar.png"),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: 25,
//                     width: 25,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).accentColor,
//                         shape: BoxShape.circle),
//                     child: Icon(
//                       Icons.edit,
//                       size: ScreenUtil().setSp(15),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Kalana Mihiranga",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "071802532",
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           RaisedButton(
//             child: Text("Locations"),
//             onPressed: () {
//               double distanceInMeters = distanceBetween(
//                   position.latitude, position.longitude, 8.1540, 80.3046);

//               showNotification("NAme", 1, "Delay");
//               userlocation();
//               print(distanceInMeters);
//             },
//           ),
//           Container(
//             height: 40,
//             width: 200,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Theme.of(context).accentColor,
//             ),
//             child: Center(
//               child: Text("Change my account details"),
//             ),
//           )
//         ],
//       ),
//     );
//     var header = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(
//           height: 50,
//         ),
//         Icon(
//           Icons.arrow_back,
//           size: ScreenUtil().setSp(30),
//         ),
//         userprofile,
//         Icon(
//           LineAwesomeIcons.sun_o,
//           size: ScreenUtil().setSp(30),
//         ),
//         SizedBox(
//           height: 50,
//         ),
//       ],
//     );
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 50,
//           ),
//           header,
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 ProfileListItem(
//                   icon: LineAwesomeIcons.adjust,
//                   text: "Delete my account".tr().toString(),
//                 ),
//                 ProfileListItem(
//                   icon: LineAwesomeIcons.users,
//                   text: "Invite Friends".tr().toString(),
//                 ),
//                 ProfileListItem(
//                   icon: LineAwesomeIcons.train,
//                   text: "About Us",
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future notifyme(String payload) async {}
// }

// class ProfileListItem extends StatelessWidget {
//   final IconData icon;
//   final text;
//   final bool hasNavigation;

//   const ProfileListItem({this.icon, this.text, this.hasNavigation = true});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       margin: EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 20),
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.grey,
//       ),
//       child: Row(
//         children: <Widget>[
//           Icon(
//             this.icon,
//             size: 25,
//           ),
//           SizedBox(
//             width: 25,
//           ),
//           Text(this.text, style: TextStyle(fontWeight: FontWeight.w500)),
//           Spacer(),
//           // if (this.hasNavigation)
//           //   Icon(
//           //     LineAwesomeIcons.angle_right,
//           //     size: 25,
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 1,
        // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (null)),
      ),
    );
    //   body: Container(
    //     child: ListView(
    //       children: <Widget>[
    //         Text(
    //           "Edit Profile",
    //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         Center(
    //           child: Stack(
    //             children: <Widget>[
    //               Container(
    //                 width: 130,
    //                 height: 130,
    //                 decoration: BoxDecoration(
    //                     boxShadow: [
    //                       BoxShadow(
    //                           spreadRadius: 2,
    //                           blurRadius: 10,
    //                           color: Colors.black.withOpacity(0.1),
    //                           offset: Offset(0, 10))
    //                     ],
    //                     border: Border.all(width: 4, color: Colors.amber),
    //                     shape: BoxShape.circle,
    //                     image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: NetworkImage(
    //                             'https://picsum.photos/250?image=9'))),
    //               ),
    //               // Position er(
    //               //     height: 40,
    //               //     width: 40,
    //               //     child: Icon(
    //               //       Icons.edit,
    //               //       color: Colors.black,
    //               //     ),
    //               //   ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
