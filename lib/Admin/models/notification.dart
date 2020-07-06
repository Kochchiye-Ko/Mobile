import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  final String message;
  final String subject;
  final Timestamp dateTime;
  Notifications({this.message, this.subject, this.dateTime});
}
