import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kochchiye_ko/User/Language.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        brightness: Brightness.light,
        title: Text("Settings".tr().toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.all(15.0),
              color: Colors.amber,
              child: ListTile(
                onTap: () {},
                title: Text(
                  "Jon Doe",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(32.0, 1.0, 32.0, 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    title: Text("Change Profile Details".tr().toString()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    leading:
                        Icon(FontAwesomeIcons.language, color: Colors.black),
                    title: Text("Change langauage".tr().toString()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Language()),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.dochub, color: Colors.black),
                    title:
                        Text("View my subscribed Train list".tr().toString()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Notifications Setting",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            )
          ],
        ),
      ),
    );
  }
}
