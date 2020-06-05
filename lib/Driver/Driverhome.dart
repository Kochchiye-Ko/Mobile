import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Driverhome extends StatefulWidget {
  @override
  _DriverhomeState createState() => _DriverhomeState();
}

class _DriverhomeState extends State<Driverhome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
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
                        colors: [
                          const Color(0xFFFF5700),
                          const Color(0xFFFFDF32)
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 30,
                              left: 190,
                              child: Image.asset('assets/Driver/Driver.png'),
                              height: 270,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Cards(),Cards()],
              )),
                  Expanded(
                  child: Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Cards(),Cards()],
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 150.0,
          width: 160.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFFE44E4F),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0)
              ]),
        ),
        Container(
          alignment: FractionalOffset.topCenter,
          child: Image(image: AssetImage('assets/Driver/Start.png')),
          height: 100.0,
          width: 170.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  "Start Ride",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
