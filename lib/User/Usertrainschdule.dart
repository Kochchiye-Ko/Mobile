import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Usertrainschdule extends StatefulWidget {
  Usertrainschdule({Key key}) : super(key: key);

  @override
  _UsertrainschduleState createState() => _UsertrainschduleState();
}

class _UsertrainschduleState extends State<Usertrainschdule> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schduels"),
      ),
      
    );
  }
}
