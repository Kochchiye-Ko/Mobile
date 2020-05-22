import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection("UserTB");

  Future updateUserData(String email, String accounttype) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'accounttype': accounttype,
    });
  }
}
