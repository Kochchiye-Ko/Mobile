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

bool _progressController = true;
BitmapDescriptor pinLocationIcon;
StreamSubscription<QuerySnapshot> subscription;
List<DocumentSnapshot> snapshot2;
CollectionReference collectionReference =
    Firestore.instance.collection("trainlocations");

class _UsertrainmapState extends State<Usertrainmap> {
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

  var all;

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
            this.all = snapshot;
            print(snapshot.data.documents);
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
        _buildcontianer(),
        // Positioned(
        //   bottom: 50,
        //   left: 10,
        //   child: FlatButton(
        //     child: Icon(
        //       Icons.pin_drop,
        //       color: Colors.white,
        //     ),
        //     color: Colors.green,
        //     // onPressed: _addGeoPoint,
        //   ),
        // )
      ],
    );
  }

  Widget _buildcontianer() {
    if (_progressController) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.purpleAccent,
        ),
      );
    }
    print(snapshot2[0].data['Train Name']);
    print("Okay");
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _boxes(
                                snapshot2[index].data['imgurl'],
                                snapshot2[index].data['Lat'].toDouble(),
                                snapshot2[index].data['Long'].toDouble(),
                                snapshot2[index].data['Train Name'],
                                snapshot2[index].data['Origin'],
                                snapshot2[index].data['Destination'])),
                        SizedBox(width: 10.0),
                      ],
                    );
                  });
            }),
      ),
    );
  }

  //card animation
  Future<void> gotolocation(double lat, double lng) async {
    myController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, lng),
      zoom: 17.0,
    )));
  }

  Widget _boxes(String _image, double lat, double long, String name,
      String description, String phone) {
    return GestureDetector(
      onTap: () {
        gotolocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 300,
                  child: ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Origin:-", style: TextStyle(fontSize: 25)),
                              Text(
                                description,
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Text("Destination:-",
                                  style: TextStyle(fontSize: 25)),
                              Text(
                                phone,
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
