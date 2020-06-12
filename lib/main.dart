import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authservice.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Auth/model/user.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochiye Ko',
      debugShowCheckedModeBanner: false,
      home: Authservice().handleAuth(),
    );
    // return StreamProvider<User>.value(
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     title: 'Kochiye Ko',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home:Authservice().handleAuth(),
    //   ),
    // );
  }
}
