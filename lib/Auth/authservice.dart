import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/Auth/aa.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  String name = "";

  int counter = 0;
  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', counter);
  }

  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.counter = prefs.getInt('counter');
  }

  handleAuth(counter) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          // return TestHome();
          // print("if");
          // getCounter();
          print(getCounter());
          // print(this.counter);

          // return Test1();
          if (counter == 1) {
            return UserDetailsRegister();
          } else {
            return TestHome();
          }
        } else {
          if (counter == 1) {
            return UserDetailsRegister();
          } else {
            return Signin();
          }
          // print("if");
          // print(this.counter);
          // return Signin();
        }
      },
    );
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
    print("-----------------");
    print("-----------------");
  }

  signinWithOTP(smsCode, verID, phoneNo, xx) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verID, smsCode: smsCode);
    incrementCounter();
    signIn(authCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
