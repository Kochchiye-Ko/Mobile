import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';
import 'package:kochchiye_ko/constants/constants.dart';
import 'package:kochchiye_ko/constants/loading.dart';

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = "";
  String password = "";
  String error = "";

  _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (val) {
              setState(() => email = val);
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
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
    );
  }

  _password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (val) {
              setState(() => password = val);
            },
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  _sButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 150,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          dynamic result = await _auth.signInAnon();
          if (result == null) {
            print("errpr");
          } else {
            print("sucesses");
            print(result);
          }

          //email,passowrd ------------------------------------
          // if (_formKey.currentState.validate()) {
          //   setState(() => loading = true);
          //   dynamic result =
          //       await _auth.signInWithEmailandpassword(email, password);
          //   if (result == null) {
          //     setState(() {
          //       error = 'Could not sign in with those credentials';
          //       loading = false;
          //     });
          //   }
          // }
          //-------------------------------------------
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.blue[900],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _sinupwith() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Login with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  _socialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _socialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _socialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/icons/facebook.jpg',
            ),
          ),
          _socialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/icons/google.png',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background/watermarklogo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF4FC3F7),
                          const Color(0xFF00B0FF),
                          const Color(0xFF0288D1),
                          const Color(0xFF01579B),
                        ],
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9
                        ]),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30.0),
                          _email(),
                          SizedBox(height: 30.0),
                          _password(),
                          SizedBox(height: 30.0),
                          _sButton(),
                          FlatButton(
                            onPressed: () {
                              widget.toggleView();
                            },
                            color: Colors.transparent,
                            textColor: Colors.black38,
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "( Sign up )",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          _sinupwith(),
                          _socialBtnRow(),
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
