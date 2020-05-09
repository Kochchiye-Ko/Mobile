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
                  height: MediaQuery.of(context).size.height * 0.25,
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
                      Container(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.train,
                              size: 30,
                              color: Colors.red,
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
                            )
                            ,
                            Icon(
                              Icons.fiber_manual_record,
                              color: Color(0xFFFf89380),
                              size: 12,
                            )
                            ,
                            Icon(
                              Icons.location_on,
                              color: Color(0xFFFf89380),
                              size: 30,
                            )
                          ],
                        ),
                      )
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
