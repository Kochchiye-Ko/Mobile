import 'package:flutter/material.dart';

class Usertraindetail extends StatefulWidget {
  @override
  _UsertraindetailState createState() => _UsertraindetailState();
}

class _UsertraindetailState extends State<Usertraindetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Train Details"),
        backgroundColor: Colors.amber,
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFFf6f5fb),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              left: 30,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          _iconDestination(),
                          SizedBox(
                            width: 15,
                          ),
                          orginandDestination(),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.greenAccent,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 3,
                                  decoration:
                                      BoxDecoration(color: Colors.greenAccent),
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.greenAccent,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 3,
                                  decoration: BoxDecoration(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Colombo Fort",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Padding(padding: const EdgeInsets.only(top:16),
                                      child: Text(
                                        "Arrivaed tsfaj kfsakjfs"
                                      ),
                                      
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
      Icon(
        Icons.swap_vert,
        color: Colors.indigo,
        size: 70,
      ),
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
