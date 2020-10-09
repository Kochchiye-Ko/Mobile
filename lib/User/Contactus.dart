import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  var type, id, numb;

  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  final _formKey = GlobalKey<FormState>();
  String title, desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.orangeAccent),
              ),
              Container(
                height: 185.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Colors.white30),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                top: 57,
                left: 75.0,
                child: Container(
                  child: Text(
                    "You Got a \nsoultion!\nThats Great",
                    style: TextStyle(
                        fontSize: 30,
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
                          image: AssetImage('assets/logo.png'))),
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
                        height: 50,
                      ),
                      Text(
                        "Descripton",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        validator: (value) => value.isEmpty
                            ? 'Description cannot be blank'
                            : null,
                        onChanged: ((value) {
                          setState(() {
                            desc = value;
                          });
                        }),
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Submit your soulution",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form.validate()) {}
                          },
                        ),
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
