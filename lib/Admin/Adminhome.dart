import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kochchiye_ko/Admin/DisplayTrainsData.dart';
import 'package:kochchiye_ko/Admin/UsersAdmin.dart';
import 'package:kochchiye_ko/Admin/about.dart';
import 'package:kochchiye_ko/Admin/changepassword.dart';
import 'package:kochchiye_ko/Admin/createNotification.dart';
import 'package:kochchiye_ko/Admin/displaytrains/trainlist.dart';
import 'package:kochchiye_ko/Admin/map.dart';
import 'package:kochchiye_ko/Admin/trainsgedule.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';
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
    } else if (choice == Constant.resetPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChangePassword()),
      );
    } else if (choice == Constant.changeEmail) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          Container(
            // alignment: AlignmentDirectional.bottomEnd,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNotifications(),
                  ),
                );
              },
              child: Icon(
                Icons.notification_important,
                color: Colors.orange,
              ),
              backgroundColor: Colors.grey[800],
            ),
          ),
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/User/userbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF333231).withOpacity(0.7),
            ),
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
                      SizedBox(height: 20.0),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            child: Container(
                              width: double.infinity,
                              height: 200.0,
                              child: Image.asset("assets/background/2.png"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateNotifications()),
                              );
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
                                  "   NOTIFICATIONS",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateNotifications()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey[900],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrainShedule()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.train,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "   TRAIN",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TrainShedule()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapAdminpanel()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.map,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "   MAP",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapAdminpanel()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsersAdminpanel()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.people,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "   USERS",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UsersAdminpanel()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayTrainsData()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.directions_transit,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "   VIEW TRAINS",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TrainList()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          color: new Color(0xFF333231).withOpacity(0.5),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 80.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.info,
                                  size: 50.0,
                                  color: Colors.orange,
                                ),
                                label: new Text(
                                  "   ABOUT",
                                  style: TextStyle(
                                      color: Colors.orange[100],
                                      fontSize: 30.0),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About()),
                                  );
                                },
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
