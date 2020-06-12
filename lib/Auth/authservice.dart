import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/Testhome.dart';

class Authservice {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print("ss");
          return TestHome();
        } else {
          print("aa");
          return Signin();
        }
      },
    );
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signinWithOTP(smsCode, verID) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verID, smsCode: smsCode);
    signIn(authCredential);
  }
}
