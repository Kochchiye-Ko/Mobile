import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:kochchiye_ko/home/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochiye Ko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SignUppage(),
    );
  }
}
