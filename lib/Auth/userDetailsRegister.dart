import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/model/database.dart';
import 'package:kochchiye_ko/User/User.dart';

class UserDetailsRegister extends StatefulWidget {
  @override
  _UserDetailsRegisterState createState() => _UserDetailsRegisterState();
}

class _UserDetailsRegisterState extends State<UserDetailsRegister> {
  final _formKey = GlobalKey<FormState>();
  String firstNme, lastName, email;
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter First Name' : null,
                        decoration: InputDecoration(
                          fillColor: Colors.black.withOpacity(0.2),
                          filled: true,
                          hintText: "First Name",
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          setState(() {
                            this.firstNme = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          fillColor: Colors.black.withOpacity(0.2),
                          filled: true,
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (val) =>
                            val.isEmpty ? 'Enter Last Name' : null,
                        onChanged: (val) {
                          setState(() {
                            this.lastName = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.black.withOpacity(0.2),
                          filled: true,
                        ),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your Email' : null,
                        onChanged: (val) {
                          setState(() {
                            this.email = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: RaisedButton(
                        color: Colors.grey[900],
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // onPressed: () {
                        //   if (_formKey.currentState.validate()) {
                        //     DatabaseService()
                        //         .addUserInfo(firstNme, lastName, email);
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Testhome2()),
                        //     );
                        //   }
                        // },
                      ),
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
