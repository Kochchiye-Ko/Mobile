import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(EasyLocalization(
      child: MyApp(),
      path: "resources/langs",
      saveLocale: true,
      supportedLocales: [
        Locale("en", "EN"),
        Locale("si", "SN"),
      ],
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _progressController = true;

  Future showNotification(String name, index, type) async {
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
          if (snapshot.hasData) {
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
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purpleAccent,
              ),
            );
          }
          return StreamBuilder(
            stream: Firestore.instance
                .collection('trainlocations')
                .document("yOVBa7qOQabNthAmzeah")
                .snapshots(),
            builder: (context, snapshot2) {
              if (snapshot2.hasData) {
                var train = snapshot2.data["Lat"] ?? 0;
                double distanceInMeters = distanceBetween(snapshot2.data["Lat"],
                    snapshot2.data["Long"], 8.1540, 80.3046);

                double check = distanceInMeters / 1000.0;

                // if (check <= 5.0) {
                //   showNotification(
                //       check.toString(), check.toInt() + 10, "Near");
                // }
                return MaterialApp(
                  title: 'Kochiye Ko',
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  // home: Authservice().handleAuth(),
                  // home: UserDetailsRegister(),
                  home: TestHome(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.purpleAccent,
                  ),
                );
              }
            },
          );
        });
  }

  Future notifyme(String payload) async {}
}
