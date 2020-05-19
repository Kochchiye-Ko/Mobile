import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.orange[200].withOpacity(0.7),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class Constant {
  static const String changeEmail = 'Change E-mail';
  static const String resetPassword = 'Reset Password';
  static const String signout = 'Sign Out';
  static const List<String> choices = <String>[
    changeEmail,
    resetPassword,
    signout,
  ];
}
