import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'dart:async';
import 'dart:ui' as ui;

class Usertrainmap extends StatefulWidget {
  @override
  _UsertrainmapState createState() => _UsertrainmapState();
}

BitmapDescriptor pinLocationIcon;

class _UsertrainmapState extends State<Usertrainmap> {
  // @override
  // void initState() {
  //   super.initState();
  //   setCustomMapPin();
  // }

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)),
      'assets/12.png',
    ).then((onValue) {
      pinLocationIcon = onValue;
    });
  }

  List<LatLng> points;

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
  //all the varaibles
  Geoflutterfire geo = Geoflutterfire();
  Location location = new Location();
  GoogleMapController myController;
  Firestore firestore = Firestore.instance;
  Map<MarkerId, Marker> markerslist = <MarkerId, Marker>{};
  Uint8List imageData;

  void initState() {
    super.initState();
    setState(() {
      getMarker();
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[loadMap()],
      ),
    );
  }

  Widget loadMap() {
    return Stack(
      children: <Widget>[
        StreamBuilder(
          stream: Firestore.instance.collection('trainlocations').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.purpleAccent,
              ));

            for (int i = 0; i < snapshot.data.documents.length; i++) {
              var train = snapshot.data.documents[i];
              var lat, long;
              if (train['Lat'] == 0 || train['Long'] == 0) {
                lat = 0.0;
                long = 0.0;
              } else {
                lat = train['Lat'].toDouble();
                long = train['Long'].toDouble();
              }

              var id = MarkerId(i.toString());
              Marker mark = Marker(
                markerId: id,
                position: LatLng(lat, long),
                draggable: false,
                zIndex: 2,
                flat: true,
                rotation: lat,
                anchor: Offset(0.5, 0.5),
                infoWindow: InfoWindow(title: train['info']),
                icon: pinLocationIcon,

                //  BitmapDescriptor.defaultMarkerWithHue(
                //       BitmapDescriptor.hueViolet)
              );
              markerslist[id] = mark;
            }

            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(8.343966, 80.410869), zoom: 18),
              onMapCreated: (controller) {
                setState(() {
                  myController = controller;
                });
              },
              myLocationEnabled: true,
              mapType: MapType.hybrid,
              compassEnabled: true,
              markers: Set<Marker>.of(markerslist.values),
            );
          },
        ),
        Positioned(
          bottom: 50,
          left: 10,
          child: FlatButton(
            child: Icon(
              Icons.pin_drop,
              color: Colors.white,
            ),
            color: Colors.green,
            // onPressed: _addGeoPoint,
          ),
        )
      ],
    );
  }
}
