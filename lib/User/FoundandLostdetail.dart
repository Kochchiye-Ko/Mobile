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
      appBar: AppBar(title: Text('Lost Items '), backgroundColor: Colors.amber),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addDialog(context);
        },
        label: Text('Add New Post'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
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
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Post Title', hintText: 'Enter your title'),
                onChanged: (value) {
                  this.title = value;
                },
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
                addDialog2(context);
              },
            )
          ],
        );
      },
    );
  }

  Future<bool> addDialog2(BuildContext context) async {
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
                  child: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  this.content = value;
                },
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
              child: Text('Post New Thread'),
              textColor: Colors.blue,
              onPressed: () {
                dialogTrigger(context);
                Navigator.of(context).pop();
                // dbcrud
                //     .addData(this.title, this.content, _userProfile['PhotoURL'])
                //     .then((result) {

                // }).catchError((e) {
                //   print(e);
                // });
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
