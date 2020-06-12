import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  
  String phoneNo, verificationID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.orange),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Enter your phone number"),
                        onChanged: (val) {
                          setState(() {
                            this.phoneNo = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: RaisedButton(
                        child: Center(
                          child: Text("Login"),
                        ),
                        onPressed: () {
                          // print(phoneNo);
                          verifyPhone(phoneNo);
                        },
                      ),
                    )
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
      print(authResult);
      Authservice().signIn(authResult);
      
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationID = verId; 
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
// import 'package:kochchiye_ko/Auth/Auth.dart';
// import 'package:kochchiye_ko/Auth/model/foggotpassword.dart';
// import 'package:kochchiye_ko/constants/constants.dart';
// import 'package:kochchiye_ko/constants/loading.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

// class Signin extends StatefulWidget {
//   final Function toggleView;
//   Signin({this.toggleView});

//   @override
//   _SigninState createState() => _SigninState();
// }

// class _SigninState extends State<Signin> {
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
//             validator: (val) => val.isEmpty ? 'Enter your email' : null,
//             onChanged: (val) {
//               setState(() => email = val);
//             },
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.only(top: 14.0, left: 50.0, bottom: -10.0),
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
//             validator: (val) => val.isEmpty ? 'Enter your password' : null,
//             onChanged: (val) {
//               setState(() => password = val);
//             },
//             obscureText: true,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.white,
//               ),
//               contentPadding: EdgeInsets.only(top: 14.0, left: 50.0),
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
//       padding: EdgeInsets.symmetric(vertical: 5.0),
//       width: 150,
//       child: RaisedButton(
//         elevation: 5.0,
//         onPressed: () async {
//           // dynamic result = await _auth.signInAnon();
//           // if (result == null) {
//           //   print("errpr");
//           // } else {
//           //   print("sucesses");
//           //   print(result);
//           // }

//           //email,passowrd ------------------------------------
//           if (_formKey.currentState.validate()) {
//             setState(() => loading = true);
//             dynamic result =
//                 await _auth.signInWithEmailandpassword(email, password);
//             if (result == null) {
//               setState(() {
//                 error = 'Could not sign in with those credentials';
//                 loading = false;
//               });
//             }
//           }
//           //-------------------------------------------
//         },
//         padding: EdgeInsets.all(15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         color: Colors.white,
//         child: Text(
//           'Login',
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

//   _continueWith() {
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
//           'continue with',
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
//                   decoration: BoxDecoration(color: Colors.orange),
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
//                           SizedBox(height: 50.0),
//                           Text(
//                             "Let's Travel,",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 50.0,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Image.asset(
//                             'assets/background/2.png',
//                             width: 150,
//                           ),
//                           SizedBox(height: 20.0),
//                           _email(),
//                           SizedBox(height: 20.0),
//                           _password(),
//                           SizedBox(height: 5.0),
//                           Padding(
//                             padding: EdgeInsets.only(right: 20.0),
//                             child: Container(
//                               width: double.infinity,
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ForgotPassword(),
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   "Forgot password?",
//                                   style: TextStyle(color: Colors.blue[900]),
//                                   textAlign: TextAlign.right,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10.0),
//                           Text(
//                             error,
//                             style: TextStyle(color: Colors.red, fontSize: 14.0),
//                           ),
//                           _sButton(),
//                           SizedBox(height: 20.0),
//                           Text(
//                             "Don't have an account?",
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
//                               "Create account",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           _continueWith(),
//                           SizedBox(height: 10.0),
//                           GoogleSignInButton(
//                               onPressed: () async {
//                                 setState(() {
//                                   loading = true;
//                                 });
//                                 dynamic result = await _auth.signInWithGoogle();
//                                 if (result == null) {
//                                 } else {
//                                   print(result);
//                                 }
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
