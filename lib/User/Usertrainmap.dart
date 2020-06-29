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

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
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

  // Future<Uint8List> getMarker() async {
  //   ByteData byteData =
  //       await DefaultAssetBundle.of(context).load("assets/car_icon.png");
  //   return byteData.buffer.asUint8List();
  // }

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

  Future<DocumentReference> _addGeoPoint() async {
    var pos = await location.getLocation();
    var lat = pos.latitude;
    var lng = pos.longitude;
    GeoFirePoint point = geo.point(latitude: lat, longitude: lng);
    firestore
        .collection('trainlocations')
        .document('train3')
        .setData({'position': point.data});
    print(point.data);
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
              icon:pinLocationIcon,
              
              //  BitmapDescriptor.defaultMarkerWithHue(
              //       BitmapDescriptor.hueViolet)
              );
              markerslist[id] = mark;
            }

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(6.9337601, 79.8500765), zoom: 15),
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
            onPressed: _addGeoPoint,
          ),
        )
      ],
    );
  }
}
