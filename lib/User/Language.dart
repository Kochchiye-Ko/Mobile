import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        brightness: Brightness.light,
        title: Text(" Lanaguage"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text("Choose the lanaguage you like"),
                RaisedButton(
                  child: Text("Sinhala"),
                  onPressed: () {
                    setState(() {
                      EasyLocalization.of(context).locale = Locale("si", "SN");
                    });
                  },
                ),
                RaisedButton(
                  child: Text("English"),
                  onPressed: () {
                    setState(() {
                      EasyLocalization.of(context).locale = Locale("en", "EN");
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
