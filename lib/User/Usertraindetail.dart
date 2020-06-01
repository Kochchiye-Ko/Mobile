import 'package:flutter/material.dart';

class Usertraindetail extends StatefulWidget {
  @override
  _UsertraindetailState createState() => _UsertraindetailState();
}

class _UsertraindetailState extends State<Usertraindetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFFf6f5fb),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 30, top: 40, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      _iconDestination(),
                      SizedBox(
                        width: 15,
                      ),
                      orginandDestination()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _iconDestination() {
  return Container(
      child: Column(
    children: <Widget>[
      Icon(
        Icons.train,
        size: 30,
        color: Colors.green,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFF00d5d8),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFF00d5d8),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFF00d5d8),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFF00d5d8),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFFf89380),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFFf89380),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFFf89380),
        size: 12,
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Color(0xFFFf89380),
        size: 12,
      ),
      Icon(
        Icons.location_on,
        color: Color(0xFFFf89380),
        size: 30,
      ),
    ],
  ));
}

Widget orginandDestination() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Origin\n",
            style: TextStyle(color: Color(0xFFFb7b7c5), fontSize: 14)),
        TextSpan(
            text: "Colombo Fort",
            style: TextStyle(fontSize: 17, color: Colors.black)),
      ])),
   
      RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "Destination\n",
            style: TextStyle(color: Color(0xFFFb7b7c5), fontSize: 14)),
        TextSpan(
            text: "Anuradhapura",
            style: TextStyle(fontSize: 17, color: Colors.black)),
      ])),
    ],
  );
}
