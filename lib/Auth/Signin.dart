import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  String phoneNo, verificationID, smsCode;
  String errrorMessage = "";
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.orange[600],
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 60.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/background/2.png"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter your mobile number' : null,
                        keyboardType: TextInputType.phone,
                        maxLength: 9,
                        decoration: InputDecoration(
                          prefixText: " +94 \t ",
                          hintText: "  Enter your mobile number",
                        ),
                        onChanged: (val) {
                          setState(() {
                            this.phoneNo = "+94" + val;
                          });
                        },
                      ),
                    ),
                    codeSent
                        ? Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 6,
                              decoration:
                                  InputDecoration(hintText: "Enter OTP"),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter OTP' : null,
                              onChanged: (val) {
                                setState(() {
                                  this.smsCode = val;
                                });
                              },
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: codeSent
                          ? RaisedButton(
                              color: Colors.grey[900],
                              hoverColor: Colors.white,
                              child: Center(
                                  child: Text(
                                "Verify",
                                style: TextStyle(color: Colors.white),
                              )),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Authservice().signinWithOTP(
                                      smsCode, verificationID, phoneNo);
                                }
                              },
                            )
                          : RaisedButton(
                              color: Colors.grey[900],
                              hoverColor: Colors.white,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  verifyPhone(phoneNo);
                                }
                              },
                            ),
                    ),
                    Text(errrorMessage),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: Text(
                        "Let's Travel,",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    // RaisedButton(
                    //   child: Center(
                    //     child: Text(
                    //       "Login",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => UserDetailsRegister()),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      print("verified");
      Authservice().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      print('smsSent');
      this.verificationID = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      print("autoTimeout");
      this.verificationID = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}
