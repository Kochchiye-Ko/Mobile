import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future showNotification(String name, index, type) async {
    print(index);
    var details = new AndroidNotificationDetails(
        index.toString(), "Desi", "THis ",
        importance: Importance.max,
        priority: Priority.high,
        ongoing: true,
        autoCancel: true);
    var generatenotiofication = new NotificationDetails(android: details);
    if (type == "Delay") {
      await flutterLocalNotificationsPlugin.show(
          index,
          type + " Notice",
          name + "Train will be to Delayed.Check notification for more details",
          generatenotiofication);
    } else if (type == "Emergency") {
      await flutterLocalNotificationsPlugin.show(
          index,
          type + " Notice",
          name +
              " Has an emergency breakdown.\nSee notification for more details ",
          generatenotiofication);
    } else {
      await flutterLocalNotificationsPlugin.show(index, type + " Notice",
          "Your Train is coming near" + name, generatenotiofication);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var androids = new AndroidInitializationSettings('app_icon');
    var initial = new InitializationSettings(android: androids);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initial,
        onSelectNotification: notifyme);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('trainlocations').snapshots(),
        builder: (context, snapshot) {
          for (int i = 0; i < snapshot.data.documents.length; i++) {
            var train = snapshot.data.documents[i];
            var lat, long;
            if (train['Delay'] == 1) {
              showNotification(train['Train Name'], i, "Delay");
            }

            if (train['Emergency'] == 1) {
              showNotification(train['Train Name'], i, "Emergency");
            }
          }
          return StreamBuilder(
            stream: Firestore.instance
                .collection('trainlocations')
                .document("yOVBa7qOQabNthAmzeah")
                .snapshots(),
            builder: (context, snapshot) {
              var train = snapshot.data["Lat"];
              double distanceInMeters = distanceBetween(
                  snapshot.data["Lat"], snapshot.data["Long"], 8.1540, 80.3046);

              double check = distanceInMeters / 1000.0;
              print(check);
              if (check <= 3.0) {
                showNotification(check.toString(), check.toInt() + 10, "Near");
              }
              return MaterialApp(
                title: 'Kochiye Ko',
                debugShowCheckedModeBanner: false,
                // home: Authservice().handleAuth(),
                // home: UserDetailsRegister(),
                home: TestHome(),
              );
            },
          );
        });
  }

  Future notifyme(String payload) async {}
}
