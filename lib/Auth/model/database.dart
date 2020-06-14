import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kochchiye_ko/Auth/Auth.dart';
import 'package:kochchiye_ko/Auth/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection("UserTB");

  // Future updateUserData(String email, String accounttype) async {
  //   return await userCollection.document(uid).setData({
  //     'email': email,
  //     'accounttype': accounttype,
  //   });
  // }

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     email: snapshot.data['email'],
  //     accountType: snapshot.data['accounttype'],
  //   );
  // }

  // Stream<UserData> get userData {
  //   return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  // }

  Future addUserInfo(String firstName, String lastName, String email) async {
    return await userCollection.document(firstName).setData({
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'accountType': "passanger",
      'dateTime': DateTime.now()
    });
  }
}
