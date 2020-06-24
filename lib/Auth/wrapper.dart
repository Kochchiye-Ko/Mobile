import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/Admin.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/Auth/authenticate.dart';
import 'package:kochchiye_ko/Driver/Driver.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:kochchiye_ko/User/User.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Auth/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatelessWidget {
  String accountType;
  String mail;

  Future<String> type() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    mail = email;
    final usersdata = await Firestore.instance
        .collection('UserTB')
        .where('email', isEqualTo: email)
        .getDocuments();

    accountType = usersdata.documents.first.data.values.first;

    print(email);

    print("--------------");
    print(usersdata.documents.first.data.values.first);
    print("--------------");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    type();
    if (user == null) {
      return Authenticate();
    } else {
      // if (accountType == "admin") {
      //   return Adminhome();
      // } else if (accountType == "driver") {
      //   return DriverHome();
      // } else if (accountType == "passenger") {
      //   return Userhome();
      // } else {
      //   return TestHome();
      // }
      return TestHome();
    }
  }
}
