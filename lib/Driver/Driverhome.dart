import 'package:flutter/material.dart';

class Driverhome extends StatefulWidget {
  @override
  _DriverhomeState createState() => _DriverhomeState();
}

class _DriverhomeState extends State<Driverhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [const Color(0xFFFF5700), const Color(0xFFFFDF32)])),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(size.width/2,size.height , size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return null;
  }

}