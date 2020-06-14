import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String phoneNo, verificationID, smsCode;
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
                    Container(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
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
                              decoration: InputDecoration(
                                hintText: "  Enter OTP",
                              ),
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
                      child: RaisedButton(
                        color: Colors.grey[900],
                        child: Center(
                          child: codeSent
                              ? Text(
                                  "Verify",
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                        onPressed: () {
                          codeSent
                              ? Authservice()
                                  .signinWithOTP(smsCode, verificationID)
                              : verifyPhone(phoneNo);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
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
      Authservice().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationID = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationID = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
// import 'package:kochchiye_ko/Auth/Auth.dart';
// import 'package:kochchiye_ko/constants/constants.dart';
// import 'package:kochchiye_ko/constants/loading.dart';

// class Signup extends StatefulWidget {
//   // Signup({Key key}) : super(key: key);
//   final Function toggleView;
//   Signup({this.toggleView});
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();

//   bool loading = false;
//   String email = "";
//   String password = "";
//   String error = "";

//   _email() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//             validator: (val) => val.isEmpty ? 'Enter your email' : null,
//             onChanged: (val) {
//               setState(() => email = val);
//             },
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0, left: 50.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _password() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             validator: (val) => val.isEmpty ? 'Enter your Password' : null,
//             onChanged: (val) {
//               setState(() => password = val);
//             },
//             obscureText: true,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0, left: 50.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _sButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: 150,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () async {
//           if (_formKey.currentState.validate()) {
//             // print(email);
//             // print(password);
//             setState(() => loading = true);
//             // dynamic result =
//             //     await _auth.registerWithEmailandpassword(email, password);
//             // if (result == null) {
//             //   setState(() {
//             //     error = 'Could not sign in with those credentials';
//             //     loading = false;
//             //   });
//             // }
//           }
//         },
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         color: Colors.white,
//         child: Text(
//           'Register',
//           style: TextStyle(
//             color: Colors.orange[700],
//             letterSpacing: 1.5,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   _sinupwith() {
//     return Column(
//       children: <Widget>[
//         Text(
//           '- OR -',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 10.0),
//         Text(
//           'Sign up with',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : Scaffold(
//             body: Stack(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   child: SingleChildScrollView(
//                     physics: AlwaysScrollableScrollPhysics(),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40.0,
//                       // vertical: 40.0,
//                     ),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           SizedBox(height: 90.0),
//                           Text(
//                             'Sign Up',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 50.0,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 30.0),
//                           _email(),
//                           SizedBox(height: 20.0),
//                           _password(),
//                           SizedBox(height: 20.0),
//                           SizedBox(height: 10.0),
//                           Text(
//                             error,
//                             style: TextStyle(color: Colors.red, fontSize: 14.0),
//                           ),
//                           _sButton(),
//                           Text(
//                             "Already have an account?",
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                           FlatButton(
//                             onPressed: () {
//                               widget.toggleView();
//                             },
//                             color: Colors.transparent,
//                             textColor: Colors.black38,
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           _sinupwith(),
//                           SizedBox(height: 30.0),
//                           GoogleSignInButton(
//                               onPressed: () async {
//                                 setState(() => loading = true);
//                                 // dynamic result = await _auth.signInWithGoogle();
//                                 // if (result == null) {
//                                 // } else {
//                                 //   print(result);
//                                 // }
//                               },
//                               darkMode: true),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
