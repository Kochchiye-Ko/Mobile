import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Singleroute extends StatefulWidget {
  var ind, image;
  Singleroute({this.ind, this.image});

  @override
  _SinglerouteState createState() => _SinglerouteState();
}

var items = [
  PlaceInfo(
      "Main Line".tr().toString(),
      "The Main Line starts from Colombo and runs east and north past the rapidly developing centres of Ragama, Gampaha, Veyangoda, and Polgahawela. At Rambukkana, the Main Line begins its steep climb into the hills of the upcountry. Between Balana and Kadugannawa, the track clings to the side of sheer cliffs, offering passengers views of Batalegala ('Bible' Rock). From Peradeniya Junction, a branch line reaches Kandy and Matale. The Main Line then continues its climb through tea country, connecting local market centres at Gampola, Nawalapitiya, and Hatton before reaching Nanu Oya. This is the connection to the former colonial resort of Nuwara Eliya, known for its temperate climate, classic hotels, and British-style gardens. The Main Line continues its ascent to the summit at Pattipola, 1,898 m (6,227 ft) above sea level, before descending past Bandarawela to Badulla. In the upcountry, passengers can view the tea gardens, mountains and valleys, cascading torrents and waterfalls"
          .tr()
          .toString()),
  PlaceInfo("122", "assets/User/main.jpg"),
];

class _SinglerouteState extends State<Singleroute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          flexibleSpace: Hero(
            tag: widget.ind,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(items[widget.ind].name,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    borderSide:
                        BorderSide(width: 3, color: Colors.blue.shade300),
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.blue.shade300),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.train,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("25 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(
                      "Stations",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.view_headline,
                      color: Colors.red,
                    ),
                    Text("35 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(
                      "Trains",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.red,
                    ),
                    Text("Share",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "About the Line",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                items[widget.ind].information,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  createButton(
                      icon: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      color: Colors.blue,
                      text: "View more details on google")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createButton({Icon icon, MaterialColor color, String text}) {
    return ButtonTheme(
      minWidth: 160,
      height: 45,
      child: FlatButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          icon: icon,
          color: color,
          label: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class PlaceInfo {
  final String name;
  final String information;

  PlaceInfo(this.name, this.information);
}
