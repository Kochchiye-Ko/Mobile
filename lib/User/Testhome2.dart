import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Testhome2 extends StatefulWidget {
  @override
  _Testhome2State createState() => _Testhome2State();
}

final Color primary = Color(0xffEBBb13);
final Color active = Color(0xffffffff);

class _Testhome2State extends State<Testhome2> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(children: <Widget>[
      new Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              CustomBody(),
              Homebody(),
            ],
          ),
        ),

        //  bottomNavigationBar: AppBottomNav(),
      ),
    ]);
  }
}

class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 340),
        child: Column(
          children: <Widget>[
            Card(title: "Live location Map",),
            Card(title: "Trains on tracks",),
            Card(title: "Train Schdules",),
         
          ],
        ));
  }
}

class CustomBody extends StatelessWidget {
  // CustomBody(GlobalKey<ScaffoldState> scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomeHeader(),
      ],
    );
  }
}

class CustomeHeader extends StatelessWidget {
  // CustomeHeader(GlobalKey<ScaffoldState> scaffoldKey);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        HeaderBackground(),
        Container(
          alignment: Alignment.center,
          height: 250,
          padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Where is the train",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n\nA Way to make your journey easy',
                          style: TextStyle(fontSize: 20, color: Colors.white70))
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 150,
            color: Colors.white,
          ),
        ),
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/User/userbg2.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken))),
          ),
        )
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Card extends StatelessWidget {
  final String title;
  final String img;

  const Card({Key key, this.img, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/User/11.jpg"))),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color(0xFFFF961F).withOpacity(0.7),
                      Color(0xFFB5BFD0).withOpacity(0.7)
                    ])),
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                        TextSpan(
                            text: title,
                            style: TextStyle(fontSize: 16))
                      ])),
                )),
          ),
        )
      ],
    );
  }
}
