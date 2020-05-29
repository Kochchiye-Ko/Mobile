import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochchiye_ko/Admin/models/notification.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference notificationCollection =
      Firestore.instance.collection("AdminNotifications");

  Future addNotifications(String msg, String accounttype) async {
    return await notificationCollection.document(uid).setData({
      'Message': msg,
      'To Account': accounttype,
      'dateTime': DateTime.now()
    });
  }

  Stream<List<Notifications>> get allNotifications {
    return notificationCollection.orderBy("dateTime", descending: true)
        .snapshots()
        .map(_notificationListFromSnapshot);
  }

  List<Notifications> _notificationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notifications(
        message: doc.data['Message'],
        toaccount: doc.data['To Account'],
        dateTime: doc.data['dateTime'],
      );
    }).toList();
  }
}
