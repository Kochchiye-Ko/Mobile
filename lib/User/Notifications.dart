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
  CollectionReference collectionReference =
      Firestore.instance.collection("Notification");

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
    setState(() {
      _progressController = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int num = snapshot?.length ?? 0;
    print(snapshot.length);
    return Scaffold(
      appBar:
          AppBar(title: Text('Notifications '), backgroundColor: Colors.amber),
      body: Center(
        child: _progressController
            ? CircularProgressIndicator(
                backgroundColor: Colors.purpleAccent,
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
                            Icons.gps_not_fixed,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        title: new Text(
                          // "Okay",
                          snapshot[index].data['subject'],
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        subtitle: new Text(
                          "Okay",
                          // snapshot[index].data['message'],
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 1,
                        ),
                        trailing: Row(
                            verticalDirection: VerticalDirection.up,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.green,
                                size: 15.0,
                              ),
                              // new Text(
                              //     snapshot[index].data['Views'].toString()),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.comment,
                                color: Colors.red,
                                size: 15.0,
                              ),
                              new Text('22'),
                            ])),
                  );
                },
              ),
      ),
    );
  }
}
