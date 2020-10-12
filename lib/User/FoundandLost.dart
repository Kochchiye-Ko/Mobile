import 'package:flutter/material.dart';
import 'package:kochchiye_ko/User/FoundandLostdetail.dart';

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
                    color: Colors.indigoAccent),
              ),
              Container(
                height: 285.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(175.0)),
                    color: Color(0x61e2ff)),
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
                        color: Colors.black),
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
                          fit: BoxFit.contain,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoundandLostdetail(id: 0)),
                  );
                },
                child: AspectRatio(
                    aspectRatio: 1.55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xFFe8973a)),
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
                                  ),
                                  Text(
                                    "Post about your lost items",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoundandLostdetail(id: 1)),
                  );
                },
                child: AspectRatio(
                    aspectRatio: 1.55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xFF9de620)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 80, left: 10),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Found Items",
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.white),
                                  ),
                                  Text(
                                    "See weather some one have found it",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                            AspectRatio(
                              aspectRatio: 0.71,
                              child: Image.asset(
                                "assets/glove.png",
                                alignment: Alignment.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
