import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'dart:async';
import 'dart:ui' as ui;

class MapAdminpanel extends StatefulWidget {
  @override
  _MapAdminpanelState createState() => _MapAdminpanelState();
}

class _MapAdminpanelState extends State<MapAdminpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.grey[900],
      ),
      body: Geomap(),
    );
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
        children: <Widget>[
          loadMap(),
        ],
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

            for (int i = 0; i <snapshot.data.documents.length; i++) {
              print("object");
              var train = snapshot.data.documents[i];
              GeoPoint geoPoint = train['position']['geopoint'];
              double lat = geoPoint.latitude;
              double long = geoPoint.longitude;

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
                icon: BitmapDescriptor.fromBytes(imageData),
              );
              markerslist[id] = mark;
            }

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(6.9337601, 79.8500765), zoom: 5),
              onMapCreated: (controller) {
                setState(() {
                  myController = controller;
                });
              },
              myLocationEnabled: true,
              compassEnabled: true,
              markers: Set<Marker>.of(markerslist.values),
            );
          },
        ),
      ],
    );
  }
}
