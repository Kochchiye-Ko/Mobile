import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 1,
          // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (null)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              child: ListView(children: <Widget>[
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Stack(
              children: <Widget>[
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      border: Border.all(width: 4, color: Colors.amber),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://picsum.photos/250?image=9'))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )),
            TextField(
              decoration: InputDecoration(
                  labelText: "Full name",
                  hintText: "Dor Alex",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "07182025422",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                  labelText: "Date Regsirted",
                  hintText: "07182025422",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: <Widget>[
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            )
          ])),
        ));
  }
}
