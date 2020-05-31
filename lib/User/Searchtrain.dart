import 'package:flutter/material.dart';


class Searchtrain extends StatefulWidget {
  @override
  _SearchtrainState createState() => _SearchtrainState();
}

class _SearchtrainState extends State<Searchtrain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(child: Trainview(),),
    );
  }
}


class Trainview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
            
          ),
        )
      ],
    );
  }
  
}