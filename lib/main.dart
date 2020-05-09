import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/Adminhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochiye Ko',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Adminhome(),
    );
  }
}
