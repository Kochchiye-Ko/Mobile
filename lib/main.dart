import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochiye Ko',
      debugShowCheckedModeBanner: false,
      home: Authservice().handleAuth(count),
      // home: UserDetailsRegister(),
    );
  }
}
