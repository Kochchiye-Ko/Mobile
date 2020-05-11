import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Auth/authenticate.dart';
import 'package:kochchiye_ko/Testhome.dart';
import 'package:provider/provider.dart';
import 'package:kochchiye_ko/Auth/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) { final user = Provider.of<User>(context);
   
    if (user == null) {
      return Authenticate();
    }else{
      return TestHome();
    }
  }
}
