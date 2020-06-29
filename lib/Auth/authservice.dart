import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/Auth/aa.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';

class Authservice {
  handleAuth(counter) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          // return TestHome();
          print("---------*********--------");
          print(counter);
          print("----------*******-------");
          return Test1();
        } else {
          print("--------else---------");
          print(counter);
          print("-----------------");
          if (counter != 0) {
            return UserDetailsRegister();
          } else {
            return Signin();
          }
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

  signinWithOTP(smsCode, verID, phoneNo) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verID, smsCode: smsCode);
    signIn(authCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
