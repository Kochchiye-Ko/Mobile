import 'package:flutter/material.dart';

class Trainroute extends StatefulWidget {
  @override
  _TrainrouteState createState() => _TrainrouteState();
}

class _TrainrouteState extends State<Trainroute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Routes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                        colors: [Colors.pink, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),boxShadow: :[]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
