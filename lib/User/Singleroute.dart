import 'package:flutter/material.dart';

class Singleroute extends StatefulWidget {
  var ind, image;
  Singleroute({this.ind, this.image});

  @override
  _SinglerouteState createState() => _SinglerouteState();
}

class _SinglerouteState extends State<Singleroute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          flexibleSpace: Hero(
            tag: widget.ind,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
