import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';
import 'package:kochchiye_ko/Auth/userDetailsRegister.dart';
import 'package:kochchiye_ko/Testhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochiye Ko',
      debugShowCheckedModeBanner: false,
      home: Authservice().handleAuth(),
      // home: UserDetailsRegister(),
    );
  }
}
