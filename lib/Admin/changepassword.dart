import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kochchiye_ko/constants/constants.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String email = "";
  String message = "";
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  final nameHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Reset Password"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.orange),
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: <Widget>[
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
