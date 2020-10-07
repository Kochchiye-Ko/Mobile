import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';
import 'package:kochchiye_ko/Admin/displaytrains/trainlist.dart';
import 'package:kochchiye_ko/Admin/models/trains.dart';
import 'package:provider/provider.dart';

class DisplayTrainsData extends StatefulWidget {
  @override
  _DisplayTrainsDataState createState() => _DisplayTrainsDataState();
}

class _DisplayTrainsDataState extends State<DisplayTrainsData> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Trains>>.value(
      value: DatabaseService().allTrains,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Train List"),
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.grey[800],
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/User/userbgdark.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: TrainList(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
