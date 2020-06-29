// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kochchiye_ko/Driver/Driver.dart';

// class Driverhome extends StatefulWidget {
//   @override
//   _DriverhomeState createState() => _DriverhomeState();
// }

// class _DriverhomeState extends State<Driverhome> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               ClipPath(
//                 clipper: MyClipper(),
//                 child: Container(
//                   height: 350,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [
//                           const Color(0xFFFF5700),
//                           const Color(0xFFFFDF32)
//                         ]),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Expanded(
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               top: 50,
//                               left: 260,
//                               child: Image.asset('assets/Driver/Driver.png'),
//                               height: 250,
//                             ),
//                             Positioned(
//                               top: 130,
//                               left: 5,
//                               child:
//                                   Image.asset('assets/Driver/Trainimage.png'),
//                               height: 270,
//                               width: 300,
//                             ),
//                             Positioned(
//                                 top: 70,
//                                 left: 20,
//                                 child: Text("Good Morning",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 30,
//                                         color: Colors.white))),
//                             Positioned(
//                                 top: 120,
//                                 left: 20,
//                                 child: Text(
//                                   "Welcom Driver",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 30),
//                                 )),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Driverstart()),
//                           );
//                         },
//                         child: Cards(
//                           img: "assets/Driver/Ride.png",
//                           title: "Start Journey",
//                         )),
//                     Cards(
//                         img: "assets/Driver/Notification.png",
//                         title: "Notifications")
//                   ],
//                 ),
//               )),
//               Expanded(
//                   child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Cards(img: "assets/Driver/Ride.png", title: "Start Ride"),
//                     Cards(img: "assets/Driver/Ride.png", title: "Start Ride")
//                   ],
//                 ),
//               )),
//             ],
//           ),
//           Positioned(top: 320, left: 20, child: Text("See the details belwo")),
//         ],
//       ),
//     );
//   }
// }

// class Cards extends StatelessWidget {
//   final String img;
//   final String title;
//   // final Color color;
//   /// final double height;
//   // final double width;

//   const Cards({
//     Key key,
//     this.img,
//     this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           height: 150.0,
//           width: 160.0,
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Color(0xFFE44E4F),
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                     color: Colors.black45,
//                     offset: Offset(0.0, 10.0),
//                     blurRadius: 10.0)
//               ]),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
//           child: Container(
//             alignment: FractionalOffset.topCenter,
//             child: Image(image: AssetImage(img)),
//             height: 90.0,
//             width: 85.0,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 40.0, top: 120.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Flexible(
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 15),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 80);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - 80);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
