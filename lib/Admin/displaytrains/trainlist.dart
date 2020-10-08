import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/displaytrains/traintiles.dart';
import 'package:kochchiye_ko/Admin/models/trains.dart';
import 'package:provider/provider.dart';

class TrainList extends StatefulWidget {
  @override
  _TrainListState createState() => _TrainListState();
}

class _TrainListState extends State<TrainList> {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<Trains>>(context) ?? [];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return TrainsTile(notification: notifications[index]);
      },
    );
  }
}
