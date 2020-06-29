import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/constants/constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  String message = "";
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  final nameHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      child: TextFormField(
                        controller: nameHolder,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              top: 14.0, left: 50.0, bottom: -10.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  width: 150,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) => print("check"));
                        nameHolder.clear();
                        setState(() {
                          message =
                              "Link will be sent your mail... Click on that link to reset your password";
                        });
                      } else {
                        setState(() {
                          message = null;
                        });
                      }
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.orange[700],
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signin(),
                      ),
                    );
                  },
                  child: Text(
                    "[ Login ]",
                    style: TextStyle(color: Colors.blue[900], fontSize: 20.5),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
