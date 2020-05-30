import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';

class CreateNotificationPanel extends StatefulWidget {
  @override
  _CreateNotificationPanelState createState() =>
      _CreateNotificationPanelState();
}

class _CreateNotificationPanelState extends State<CreateNotificationPanel> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'One';
  final nameHolder = TextEditingController();
  _showSnackBar() {
    final snackBar = new SnackBar(
      content: Text(
        "Your message was sent",
        style: TextStyle(fontSize: 20.0),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.green[300],
    );
    _sKey.currentState.showSnackBar(snackBar);
  }

  String msg;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  String accountype = "";
  String errorMsg1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Notifications"),
        backgroundColor: Colors.grey[900],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[600],
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Subject",
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      onChanged: (val) {},
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Subject",
                    //       fillColor: Colors.grey[300],
                    //       filled: true),
                    //   onChanged: (val) {},
                    // ),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.orange,
                      ),
                      iconSize: 24,
                      elevation: 0,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      underline: Container(
                        height: 2,
                        color: Colors.orange,
                      ),
                      dropdownColor: Colors.grey[900],
                      hint: Text("Select a Train"),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'One',
                        'Two',
                        'Free',
                        'Four1',
                        'Four2',
                        'Four3',
                        'Four4',
                        'Four5',
                        'Four6'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameHolder,
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Message' : null,
                          onChanged: (val) {
                            setState(() => msg = val);
                          },
                          maxLines: 5,
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter your Message here"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Checkbox(
                              activeColor: Colors.orange,
                              value: checkBoxValue1,
                              onChanged: (bool value) {
                                setState(() {
                                  checkBoxValue1 = value;
                                  checkBoxValue3 = false;
                                  checkBoxValue2 = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "To all",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Checkbox(
                              value: checkBoxValue2,
                              activeColor: Colors.orange,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue2 = value;
                                  checkBoxValue3 = false;
                                  checkBoxValue1 = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "To Drivers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Checkbox(
                              activeColor: Colors.orange,
                              value: checkBoxValue3,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue3 = value;
                                  checkBoxValue1 = false;
                                  checkBoxValue2 = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "To Passengers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      errorMsg1,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    FlatButton.icon(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 10.0),
                      label: new Text(
                        " Send",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      color: Colors.orange,
                      onPressed: () async {
                        if (checkBoxValue1 == true) {
                          setState(() {
                            accountype = "to_all";
                          });
                        } else if (checkBoxValue2 == true) {
                          accountype = "to_drivers";
                          setState(() {});
                        } else if (checkBoxValue3 == true) {
                          accountype = "to_passengers";
                        } else {}

                        if (((checkBoxValue1 ||
                                    checkBoxValue2 ||
                                    checkBoxValue3) ==
                                false) ||
                            msg == null) {
                          setState(() {
                            errorMsg1 = "Enter all required data";
                          });
                        } else {
                          await DatabaseService()
                              .addNotifications(msg, accountype);
                          setState(() {
                            checkBoxValue1 = false;
                            checkBoxValue2 = false;
                            checkBoxValue3 = false;
                            nameHolder.clear();
                            errorMsg1 = "";
                          });
                          _showSnackBar();
                        }
                      },
                    ),
                  ],
                ),
              ),
              // child: Form(
              // child: Column(
              //   // mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Container(
              //       child: Column(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Row(
              //             children: <Widget>[
              //               Text("Subject"),

              //             ],
              //           ),
              //           Card(
              //             color: Colors.grey[300],
              //             child: Padding(
              //               padding: EdgeInsets.all(8.0),
              //               child: TextFormField(
              //                 controller: nameHolder,
              //                 validator: (val) =>
              //                     val.isEmpty ? 'Enter your Message' : null,
              //                 onChanged: (val) {
              //                   setState(() => msg = val);
              //                 },
              //                 maxLines: 5,
              //                 decoration: InputDecoration.collapsed(
              //                     hintText: "Enter your Message here"),
              //               ),
              //             ),
              //           ),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: <Widget>[
              //               Row(
              //                 children: <Widget>[
              //                   Column(
              //                     children: <Widget>[
              //                       Checkbox(
              //                         activeColor: Colors.orange,
              //                         value: checkBoxValue1,
              //                         onChanged: (bool value) {
              //                           setState(() {
              //                             checkBoxValue1 = value;
              //                             checkBoxValue3 = false;
              //                             checkBoxValue2 = false;
              //                           });
              //                         },
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: <Widget>[
              //                       Text(
              //                         "To all",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 17.0,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //               Row(
              //                 children: <Widget>[
              //                   Column(
              //                     children: <Widget>[
              //                       Checkbox(
              //                         value: checkBoxValue2,
              //                         activeColor: Colors.orange,
              //                         onChanged: (value) {
              //                           setState(() {
              //                             checkBoxValue2 = value;
              //                             checkBoxValue3 = false;
              //                             checkBoxValue1 = false;
              //                           });
              //                         },
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: <Widget>[
              //                       Text(
              //                         "To Drivers",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 17.0,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //               Row(
              //                 children: <Widget>[
              //                   Column(
              //                     children: <Widget>[
              //                       Checkbox(
              //                         activeColor: Colors.orange,
              //                         value: checkBoxValue3,
              //                         onChanged: (value) {
              //                           setState(() {
              //                             checkBoxValue3 = value;
              //                             checkBoxValue1 = false;
              //                             checkBoxValue2 = false;
              //                           });
              //                         },
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: <Widget>[
              //                       Text(
              //                         "To Passengers",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 17.0,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(height: 10.0),
              //               Text(
              //                 errorMsg1,
              //                 style: TextStyle(
              //                   color: Colors.red,
              //                 ),
              //               ),
              //               SizedBox(height: 10.0),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: <Widget>[
              //                   FlatButton.icon(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: 100.0, vertical: 10.0),
              //                     label: new Text(
              //                       " Send",
              //                       style: TextStyle(
              //                           color: Colors.white, fontSize: 20.0),
              //                     ),
              //                     icon: Icon(
              //                       Icons.send,
              //                       color: Colors.white,
              //                     ),
              //                     shape: new RoundedRectangleBorder(
              //                         borderRadius:
              //                             new BorderRadius.circular(5.0)),
              //                     color: Colors.orange,
              //                     onPressed: () async {
              //                       if (checkBoxValue1 == true) {
              //                         setState(() {
              //                           accountype = "to_all";
              //                         });
              //                       } else if (checkBoxValue2 == true) {
              //                         accountype = "to_drivers";
              //                         setState(() {});
              //                       } else if (checkBoxValue3 == true) {
              //                         accountype = "to_passengers";
              //                       } else {}

              //                       if (((checkBoxValue1 ||
              //                                   checkBoxValue2 ||
              //                                   checkBoxValue3) ==
              //                               false) ||
              //                           msg == null) {
              //                         setState(() {
              //                           errorMsg1 = "Enter all required data";
              //                         });
              //                       } else {
              //                         await DatabaseService()
              //                             .addNotifications(msg, accountype);
              //                         setState(() {
              //                           checkBoxValue1 = false;
              //                           checkBoxValue2 = false;
              //                           checkBoxValue3 = false;
              //                           nameHolder.clear();
              //                           errorMsg1 = "";
              //                         });
              //                         _showSnackBar();
              //                       }
              //                     },
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
