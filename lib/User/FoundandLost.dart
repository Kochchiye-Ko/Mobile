import 'package:flutter/material.dart';

class Foundandlost extends StatefulWidget {
  @override
  _FoundandlostState createState() => _FoundandlostState();
}

class _FoundandlostState extends State<Foundandlost> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    double defaultSize = data.orientation == Orientation.landscape
        ? data.size.height * 0.24
        : data.size.width * 0.24;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lost and Found"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.white24),
              ),
              Container(
                height: 285.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.white30),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                top: 57,
                left: 30.0,
                child: Container(
                  child: Text(
                    "Lost an Item? \nDont worry!\nWe got you \nbuddy",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 120.0,
                child: Container(
                  height: 300.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/User/Police.png'))),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              AspectRatio(
                  aspectRatio: 1.55,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultSize * 1.0),
                          color: Color(0xFFD82D40)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Lost Items",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                )
                              ],
                            ),
                          )),
                          AspectRatio(
                            aspectRatio: 0.71,
                            child: Image.asset(
                              "assets/User/lost.png",
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              AspectRatio(
                  aspectRatio: 1.55,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultSize * 1.0),
                          color: Color(0xFF90AF17)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Found Items",
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                )
                              ],
                            ),
                          )),
                          AspectRatio(
                            aspectRatio: 0.71,
                            child: Image.asset(
                              "assets/User/lost.png",
                              alignment: Alignment.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
