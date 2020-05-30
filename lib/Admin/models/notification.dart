import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  final String message;
  final String toaccount;
  final Timestamp dateTime;
  Notifications({this.message, this.toaccount, this.dateTime});
}
