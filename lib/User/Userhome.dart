import 'package:flutter/material.dart';
import 'package:kochchiye_ko/User/User.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';

class Userhome extends StatefulWidget {
  Userhome({Key key}) : super(key: key);

  @override
  _UserhomeState createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: new Text("Logout"),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              RaisedButton(
                child: Text("Go to UserMap"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usertrainmap()),
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Go to UserTrain Deatils"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usertraindetail()),
                  );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
