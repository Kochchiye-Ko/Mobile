import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/Auth/model/database.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return TestHome();
        } else {
          return Signin();
        }
      },
    );
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signinWithOTP(smsCode, verID, phoneNo) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verID, smsCode: smsCode);
    // DatabaseService().addAccount(phoneNo);
    signIn(authCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
