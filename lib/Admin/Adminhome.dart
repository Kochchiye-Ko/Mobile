import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';
import 'package:kochchiye_ko/Auth/wrapper.dart';
import 'package:kochchiye_ko/constants/constants.dart';

class Adminhome extends StatefulWidget {
  @override
  _AdminhomeState createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  final AuthService _auth = AuthService();

  void choiceAction(String choice) async {
    if (choice == Constant.signout) {
      await _auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    } else if (choice == Constant.resetPassword) {
    } else if (choice == Constant.changeEmail) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constant.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[800]),
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.add_alert,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "Create Notifications",
                                  style: TextStyle(
                                      color: Colors.orange[200],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.add_alert,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "Train Shedules",
                                  style: TextStyle(
                                      color: Colors.orange[200],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              child: Text('A card that can be tapped'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              child: Text('A card that can be tapped'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              child: Text('A card that can be tapped'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              child: Text('A card that can be tapped'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Colors.grey[700],
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              child: Text('A card that can be tapped'),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
