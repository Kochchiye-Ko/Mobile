import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

bool _progressController = true;

Map<String, dynamic> _userProfile;

class _NotificationsState extends State<Notifications> {
  String title, content;
  //Subscribing for post details
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  Query collectionReference = Firestore.instance
      .collection("Notification")
      .orderBy("dateTime", descending: true);

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
        if (snapshot != null) {
          setState(() {
            _progressController = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int num = snapshot?.length ?? 0;

    return Scaffold(
      appBar:
          AppBar(title: Text('Notifications '), backgroundColor: Colors.amber),
      body: Center(
        child: _progressController
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.purpleAccent,
                ),
              )
            : new ListView.builder(
                itemCount: num,
                itemBuilder: (context, index) {
                  return new Card(
                    elevation: 15.0,
                    margin: EdgeInsets.all(10.0),
                    child: new ListTile(
                        onTap: () {
                          //For udating the view count
                        },
                        leading: new IconButton(
                          icon: new Icon(
                            Icons.add_alert,
                            size: 35,
                            color: Colors.amber,
                          ),
                          onPressed: () {},
                        ),
                        title: new Text(
                          // "Okay",
                          snapshot[index].data['subject'],
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: new Text(
                          snapshot[index].data['message'],
                          // snapshot[index].data['message'],
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Row(
                                verticalDirection: VerticalDirection.up,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.red,
                                    size: 15.0,
                                  ),
                                ]),
                            Text("By admin")
                          ],
                        )),
                  );
                },
              ),
      ),
    );
  }
}
