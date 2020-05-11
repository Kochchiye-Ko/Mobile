import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/watermarklogo.png'),
          fit: BoxFit.fitWidth,
        ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF4FC3F7),
              const Color(0xFF00B0FF),
              const Color(0xFF0288D1),
              const Color(0xFF01579B),
            ],
            stops: [
              0.1,
              0.4,
              0.6,
              0.9
            ]),
      ),
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
