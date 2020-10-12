import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/User/Singleroute.dart';
import 'package:easy_localization/easy_localization.dart';

class Trainroute extends StatefulWidget {
  @override
  _TrainrouteState createState() => _TrainrouteState();
}

class _TrainrouteState extends State<Trainroute> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo(
        'Main Line'.tr().toString(),
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        4.4,
        'Start--->  Colombo Fort',
        'End:---> Jaffna',
        "assets/User/main.jpg"),
    PlaceInfo('Coastal line', Color(0xffFFB157), Color(0xffFFA057), 3.7,
        'Start---> Colombo Fort', 'End---> Jaffna', "assets/User/costal.jpg"),
    PlaceInfo('Puttalam line', Color(0xffFF5B95), Color(0xffF8556D), 4.5,
        'Start---> Colombo Fort', 'End---> Jaffna', "assets/User/puttlam.jpg"),
    PlaceInfo('Kelani Valley line', Color(0xffD76EF5), Color(0xff8F7AFE), 4.1,
        'Start---> Colombo Fort', 'End---> Jaffna', "assets/User/kelani.jpg"),
    PlaceInfo('Matale line', Color(0xff42E695), Color(0xff3BB2B8), 4.2,
        'Start--->  Colombo Fort', 'End---> Jaffna', "assets/User/costal.jpg"),
    PlaceInfo('Northern line', Color(0xffFFB157), Color(0xffFFA057), 4.2,
        'Start--->  Colombo Fort', 'End---> Jaffna', "assets/User/costal.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Train Routes".tr().toString()),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Singleroute(image: items[index].image, ind: index),
                  ));
            },

            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(
                            colors: [
                              items[index].startColor,
                              items[index].endColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100, 150),
                        painter: CustomCardShapePainter(_borderRadius,
                            items[index].startColor, items[index].endColor),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: index,
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: AssetImage(items[index].image),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                                // Text(
                                //   items[index].category,
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontFamily: 'Avenir',
                                //   ),
                                // ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index].location,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.gps_fixed,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index].category,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "See More info",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                // RatingBar(rating: items[index].rating),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ),
          );
        },
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;
  var image;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category, this.image);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
