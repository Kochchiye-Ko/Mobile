// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kochchiye_ko/Admin/models/notification.dart';
// import 'package:kochchiye_ko/Admin/models/trains.dart';

// class DatabaseService {
//   final String uid;
//   DatabaseService({this.uid});

//   final CollectionReference notificationCollection =
//       Firestore.instance.collection("Notification");

//   Future addNotifications(String msg, String subject) async {
//     return await notificationCollection.document(uid).setData({
//       'message': msg,
//       'subject': subject,
//       'author': "admin",
//       'dateTime': DateTime.now().toString()
//     });
//   }

//   Stream<List<Notifications>> get allNotifications {
//     return notificationCollection
//         .where("author", isEqualTo: "admin")
//         .orderBy("dateTime", descending: true)
//         .snapshots()
//         .map(_notificationListFromSnapshot);
//   }

//   List<Notifications> _notificationListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Notifications(
//         message: doc.data['message'],
//         subject: doc.data['subjectTo Account'],
//         dateTime: doc.data['dateTime'],
//       );
//     }).toList();
//   }

//   final CollectionReference trainCollection =
//       Firestore.instance.collection("TrainDetails");

//   Future addTrains(
//     String trainNumber,
//     String trainName,
//     String trainType,
//     String dailyOrweekend,
//     String startStaion,
//     String endStaion,
//     String startTime,
//     String endTime,
//   ) async {
//     return await trainCollection.document(trainNumber).setData({
//       'trainNumber': trainNumber,
//       'trainName': trainName,
//       'trainType': trainType,
//       'dailyOrweekend': dailyOrweekend,
//       'startStaion': startStaion,
//       'endStaion': endStaion,
//       'startTime': startTime,
//       'endTime': endTime,
//     });
//   }

//   Stream<List<Trains>> get allTrains {
//     return trainCollection
//         .orderBy("trainNumber", descending: true)
//         .snapshots()
//         .map(_trainListFromSnapshot);
//   }

//   List<Trains> _trainListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Trains(
//         dailyOrweekend: doc.data['dailyOrweekend'],
//         endStaion: doc.data['endStaion'],
//         endTime: doc.data['endTime'],
//         startStaion: doc.data['startStaion'],
//         startTime: doc.data['startTime'],
//         trainName: doc.data['trainName'],
//         trainNumber: doc.data['trainNumber'],
//         trainType: doc.data['trainType'],
//       );
//     }).toList();
//   }

// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochchiye_ko/Admin/models/inboxob.dart';
import 'package:kochchiye_ko/Admin/models/notification.dart';
import 'package:kochchiye_ko/Admin/models/trains.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference notificationCollection =
      Firestore.instance.collection("Notification");

  Future addNotifications(String msg, String subject) async {
    return await notificationCollection.document(uid).setData({
      'message': msg,
      'subject': subject,
      'author': "admin",
      'dateTime': DateTime.now().toString()
    });
  }

  Stream<List<Notifications>> get allNotifications {
    return notificationCollection
        .orderBy("dateTime", descending: true)
        .snapshots()
        .map(_notificationListFromSnapshot);
  }

  List<Notifications> _notificationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notifications(
        message: doc.data['message'],
        subject: doc.data['subjectTo Account'],
        dateTime: doc.data['dateTime'],
      );
    }).toList();
  }

  final CollectionReference trainCollection =
      Firestore.instance.collection("TrainDetails");

  Future addTrains(
    String trainNumber,
    String trainName,
    String trainType,
    String dailyOrweekend,
    String startStaion,
    String endStaion,
    String startTime,
    String endTime,
  ) async {
    return await trainCollection.document(trainNumber).setData({
      'trainNumber': trainNumber,
      'trainName': trainName,
      'trainType': trainType,
      'dailyOrweekend': dailyOrweekend,
      'startStaion': startStaion,
      'endStaion': endStaion,
      'startTime': startTime,
      'endTime': endTime,
    });
  }

  Stream<List<Trains>> get allTrains {
    return trainCollection
        .orderBy("trainNumber", descending: true)
        .snapshots()
        .map(_trainListFromSnapshot);
  }

  List<Trains> _trainListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Trains(
        dailyOrweekend: doc.data['dailyOrweekend'],
        endStaion: doc.data['endStaion'],
        endTime: doc.data['endTime'],
        startStaion: doc.data['startStaion'],
        startTime: doc.data['startTime'],
        trainName: doc.data['trainName'],
        trainNumber: doc.data['trainNumber'],
        trainType: doc.data['trainType'],
      );
    }).toList();
  }

  final CollectionReference msgCollection =
      Firestore.instance.collection("UserMessages");

  Stream<List<Inboxmessage>> get getInboxmessages {
    return msgCollection
        .orderBy("dateTime", descending: true)
        .snapshots()
        .map(_inboxmessageListFromSnapshot);
  }

  List<Inboxmessage> _inboxmessageListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Inboxmessage(
        message1: doc.data['Message'],
        subject1: doc.data['Subject'],
        dateTime1: doc.data['dateTime'],
      );
    }).toList();
  }
}
