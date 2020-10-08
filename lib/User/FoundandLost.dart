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
        title: Text("Lost and Found"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          AspectRatio(
              aspectRatio: 1.55,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultSize * 1.0),
                    color: Color(0xFFD82D40)),
              )),
        ],
      ),
    );
  }
}
