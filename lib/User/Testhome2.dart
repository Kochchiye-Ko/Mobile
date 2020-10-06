import 'package:flutter/material.dart';
import 'package:kochchiye_ko/User/Userhome.dart';
import 'package:kochchiye_ko/User/User.dart';

class Testhome2 extends StatefulWidget {
  Testhome2({Key key}) : super(key: key);

  @override
  _Testhome2State createState() => _Testhome2State();
}

class _Testhome2State extends State<Testhome2> {
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
              //    await _auth.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("User Home"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userhome()),
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Indvidual Train details"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usertraindetail()),
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
