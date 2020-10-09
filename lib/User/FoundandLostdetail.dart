import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FoundandLostdetail extends StatefulWidget {
  @override
  _FoundandLostdetailState createState() => _FoundandLostdetailState();
}

bool _progressController = true;

Map<String, dynamic> _userProfile;

class _FoundandLostdetailState extends State<FoundandLostdetail> {
  String title, content;
  //Subscribing for post details
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  Query collectionReference = Firestore.instance
      .collection("Lostitems")
      .where("state", isEqualTo: "lost");

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

  Future<void> addlost() async {
    Firestore.instance.collection('Lostitems').add({
      'date': DateTime.now(),
      'state': 'lost',
      'descriptions': "Oka",
      'itemtitle': "mAC",
      'uid': "ras",
      'userphonenumber': 1243
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    int num = snapshot?.length ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Lost Items'), backgroundColor: Colors.amber),
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
                            Icons.gps_not_fixed,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        title: new Text(
                          // "Okay",
                          snapshot[index].data['itemtitle'],
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        subtitle: new Text(
                          snapshot[index].data['descriptions'],
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

                              // new Text(snapshot[index].data['Date'].toString()),
                            ])),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addDialog(context);
        },
        label: Text('Add About Lost Item details'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Post'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: Container(
                height: 150,
                child: Column(
                  children: <Widget>[
                    new TextField(
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Post Title',
                          hintText: 'Enter your title'),
                      onChanged: (value) {
                        this.title = value;
                      },
                    ),
                    new TextField(
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Description',
                          hintText: 'Enter the event descriptions'),
                      onChanged: (value) {
                        this.title = value;
                      },
                    ),
                  ],
                ),
              )),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Next'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
                addlost().then((value) => dialogTrigger(context));
              },
            )
          ],
        );
      },
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Done', style: TextStyle(fontSize: 15.0)),
            content: Text('Added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
