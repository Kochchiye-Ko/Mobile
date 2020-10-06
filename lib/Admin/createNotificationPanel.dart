import 'package:flutter/material.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';

class CreateNotificationPanel extends StatefulWidget {
  @override
  _CreateNotificationPanelState createState() =>
      _CreateNotificationPanelState();
}

class _CreateNotificationPanelState extends State<CreateNotificationPanel> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();

  final nameHolder = TextEditingController();
  final subjectholder = TextEditingController();
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
  String subject = "";
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/User/userbgdark.jpg"),
                fit: BoxFit.cover,
              ),
            ),
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
                        fillColor: Colors.grey[300].withOpacity(0.5),
                        filled: true,
                      ),
                      controller: subjectholder,
                      onChanged: (val) {
                        this.subject = val;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      color: Colors.grey[300].withOpacity(0.5),
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
                        await DatabaseService().addNotifications(msg, subject);
                        setState(() {
                          nameHolder.clear();
                          subjectholder.clear();
                          errorMsg1 = "";
                        });

                        // _showSnackBar();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
