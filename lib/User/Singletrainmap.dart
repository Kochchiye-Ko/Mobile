import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';
import 'dart:ui' as ui;

class Singletrainmap extends StatefulWidget {
  @override
  _SingletrainmapState createState() => _SingletrainmapState();
}

bool _progressController = true;
BitmapDescriptor pinLocationIcon;
StreamSubscription<QuerySnapshot> subscription;
var snapshot2;
Stream<DocumentSnapshot> collectionReference = Firestore.instance
    .collection("trainlocations")
    .document("yOVBa7qOQabNthAmzeah")
    .snapshots();

class _SingletrainmapState extends State<Singletrainmap> {
  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)),
      'assets/Train_icon.png',
    ).then((onValue) {
      pinLocationIcon = onValue;
    });

    collectionReference.listen((event) {
      snapshot2 = event;
      if (snapshot2 != null) {
        setState(() {
          _progressController = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(snapshot2['Train name']);
    return Scaffold(
        appBar: AppBar(
          title: Text("Live location Map"),
          backgroundColor: Colors.amber,
        ),
        body: _progressController
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.purpleAccent,
                ),
              )
            : Geomap());
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
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      myLocationEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      polylines: lines,
      markers: markers,
    );
  }
}
