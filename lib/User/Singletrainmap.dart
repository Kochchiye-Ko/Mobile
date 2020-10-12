import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'dart:async';
import 'dart:ui' as ui;

class Singletrainmap extends StatefulWidget {
  @override
  _SingletrainmapState createState() => _SingletrainmapState();
}

bool _progressController = true;
BitmapDescriptor pinLocationIcon;
StreamSubscription<QuerySnapshot> subscription;
List<DocumentSnapshot> snapshot2;
CollectionReference collectionReference =
    Firestore.instance.collection("trainlocations");

class _SingletrainmapState extends State<Singletrainmap> {
  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)),
      'assets/Train_icon.png',
    ).then((onValue) {
      pinLocationIcon = onValue;
    });

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot2 = datasnapshot.documents;
        if (snapshot2 != null) {
          setState(() {
            _progressController = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Live location Map"),
          backgroundColor: Colors.amber,
        ),
        body: Geomap());
  }
}

class Geomap extends StatefulWidget {
  Geomap({Key key}) : super(key: key);

  @override
  _GeomapState createState() => _GeomapState();
}

class _GeomapState extends State<Geomap> {
  Set<Polyline> lines = {};
  Set<Marker> markers = {};
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(8.3114, 80.403711), zoom: 13);
  Uint8List imageData;
  Future<Uint8List> getMarker() async {
    ByteData data = await rootBundle.load("assets/Train_icon.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 200);
    ui.FrameInfo fi = await codec.getNextFrame();
    imageData = (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)),
      'assets/Train_icon.png',
    ).then((onValue) {
      pinLocationIcon = onValue;
    });
    markers.add(Marker(
      icon: pinLocationIcon,
      markerId: MarkerId(1.toString()),
      position: LatLng(8.3114, 80.0098),
    ));
    markers.add(Marker(
      markerId: MarkerId(1.toString()),
      position: LatLng(8.3114, 80.40371),
    ));
    markers.add(Marker(
      markerId: MarkerId(1.toString()),
      position: LatLng(8.1540, 80.3046),
    ));
    markers.add(Marker(
      markerId: MarkerId(1.toString()),
      position: LatLng(7.4818, 80.3609),
    ));
    markers.add(Marker(
      markerId: MarkerId(1.toString()),
      position: LatLng(7.0840, 80.0098),
    ));
    markers.add(Marker(
      markerId: MarkerId(1.toString()),
      position: LatLng(6.9361, 79.8450),
    ));
    lines.add(
      Polyline(
        points: [
          LatLng(8.3114, 80.40371),
          LatLng(8.1540, 80.3046),
          LatLng(7.4818, 80.3609),
          LatLng(7.0840, 80.0098),
          LatLng(6.9361, 79.8450),
        ],
        color: Colors.blueAccent,
        endCap: Cap.squareCap,
        geodesic: true,
        polylineId: PolylineId("line_one"),
      ),
    );
    lines.add(
      Polyline(
        points: [LatLng(12.949798, 77.470534), LatLng(12.938614, 77.469379)],
        color: Colors.amber,
        polylineId: PolylineId("line_one"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Polylines',
      home: Scaffold(
        body: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                polylines: lines,
                markers: markers,
              );
            }),
      ),
    );
  }
  // //all the varaibles
  // Geoflutterfire geo = Geoflutterfire();
  // Location location = new Location();
  // GoogleMapController myController;
  // Firestore firestore = Firestore.instance;
  // Map<MarkerId, Marker> markerslist = <MarkerId, Marker>{};
  // Uint8List imageData;
  // List<LatLng> points;
  // var all;

  // void initState() {
  //   super.initState();
  //   setState(() {
  //     getMarker();

  //     points = new List<LatLng>();
  //     points.add((new LatLng(41.871, -87.6298)));
  //     points.add((new LatLng(42.3314, -83.6298)));
  //     points.add((new LatLng(42.7325, -84.6298)));
  //   });
  // }

  // Future<Uint8List> getMarker() async {
  //   ByteData data = await rootBundle.load("assets/Train_icon.png");
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: 200);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   imageData = (await fi.image.toByteData(format: ui.ImageByteFormat.png))
  //       .buffer
  //       .asUint8List();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: <Widget>[loadMap()],
  //     ),
  //   );
  // }

  // Widget loadMap() {
  //   return Stack(
  //     children: <Widget>[
  //       StreamBuilder(
  //         stream: Firestore.instance.collection('trainlocations').snapshots(),
  //         builder: (context, snapshot) {
  //           if (!snapshot.hasData)
  //             return Center(
  //                 child: CircularProgressIndicator(
  //               backgroundColor: Colors.purpleAccent,
  //             ));
  //           this.all = snapshot;
  //           print(snapshot.data.documents);
  //           for (int i = 0; i < snapshot.data.documents.length; i++) {
  //             var train = snapshot.data.documents[i];
  //             var lat, long;
  //             if (train['Lat'] == 0 || train['Long'] == 0) {
  //               lat = 0.0;
  //               long = 0.0;
  //             } else {
  //               lat = train['Lat'].toDouble();
  //               long = train['Long'].toDouble();
  //             }

  //             var id = MarkerId(i.toString());
  //             Marker mark = Marker(
  //               markerId: id,
  //               position: LatLng(lat, long),
  //               draggable: false,
  //               zIndex: 2,
  //               flat: true,
  //               rotation: lat,
  //               anchor: Offset(0.5, 0.5),
  //               infoWindow: InfoWindow(title: train['info']),
  //               icon: pinLocationIcon,

  //               //  BitmapDescriptor.defaultMarkerWithHue(
  //               //       BitmapDescriptor.hueViolet)
  //             );
  //              Polyline mark = Marker(
  //               markerId: id,
  //               position: LatLng(lat, long),
  //               draggable: false,
  //               zIndex: 2,
  //               flat: true,
  //               rotation: lat,
  //               anchor: Offset(0.5, 0.5),
  //               infoWindow: InfoWindow(title: train['info']),
  //               icon: pinLocationIcon,

  //               //  BitmapDescriptor.defaultMarkerWithHue(
  //               //       BitmapDescriptor.hueViolet)
  //             );
  //             markerslist[id] = mark;
  //           }

  //           return GoogleMap(
  //             initialCameraPosition:
  //                 CameraPosition(target: LatLng(8.343966, 80.410869), zoom: 18),
  //             onMapCreated: (controller) {
  //               setState(() {
  //                 myController = controller;
  //               });
  //             },
  //             myLocationEnabled: true,
  //             mapType: MapType.hybrid,
  //             compassEnabled: true,
  //            polylines: points,
  //             markers: Set<Marker>.of(markerslist.values),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }
}
