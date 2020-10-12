import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  var type, id, numb;

  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  Future fun() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<void> contactus() async {
    Firestore.instance.collection('UserMessages').add({
      'dateTime': DateTime.now().toString(),
      'Message': title,
      'Subject': desc,
      'User': 'id1',
    }).catchError((e) {
      print(e);
    });
  }

  final _formKey = GlobalKey<FormState>();
  String title, desc;
  final TextEditingController titles = new TextEditingController();
  final TextEditingController des = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Contact us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.white),
              ),
              Container(
                height: 185.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.white30),
              ),
              Positioned(
                top: 57,
                left: 25.0,
                child: Container(
                  child: Text(
                    "Got a Problem \nWe are Here to \nhelp you",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 120.0,
                child: Container(
                  height: 300.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/customer.png'))),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Problem title",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: titles,
                        validator: (value) => value.isEmpty
                            ? 'Problem title Cannot be blank'
                            : null,
                        onChanged: ((value) {
                          setState(() {
                            title = value;
                          });
                        }),
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Icon(
                                Icons.ac_unit,
                                color: Colors.amber,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.amber,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 2.0),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 2.0),
                              borderRadius: BorderRadius.circular(35.0),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Problem Description",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: des,
                        validator: (value) => value.isEmpty
                            ? 'Problem Description cannot be blank'
                            : null,
                        onChanged: ((value) {
                          setState(() {
                            desc = value;
                          });
                        }),
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2.0),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text("Submit"),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form.validate()) {
                              contactus().then((value) => {
                                    titles.clear(),
                                    des.clear(),
                                    showAlertDialog(context),
                                  });
                            }
                          },
                        ),
                      )
                    ]),
              ))
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("You Problem sended Successfully "),
      content: Text("We Will Loook into it soon"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
