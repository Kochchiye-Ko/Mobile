import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Auth/model/user.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Kochiye Ko',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}
