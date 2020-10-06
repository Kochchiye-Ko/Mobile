import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:kochchiye_ko/Auth/Auth.dart';
import 'package:kochchiye_ko/Auth/Signin.dart';
import 'package:kochchiye_ko/User/User.dart';
import 'package:kochchiye_ko/User/Usertesthome.dart';
import 'package:kochchiye_ko/User/Usertrainschdule.dart';
import '../Animation/FadeAnimation.dart';

class Userhome extends StatefulWidget {
  @override
  _UserhomeState createState() => _UserhomeState();
}

final Color primary = Color(0xffEBBb13);
final Color active = Color(0xffffffff);
final AuthService auth = AuthService();

class _UserhomeState extends State<Userhome> {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(children: <Widget>[
      Image.asset(
        "assets/User/bghome.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      new Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // To Open/Close Sidebar
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
        backgroundColor: Colors.transparent,
        body: FoldableSidebarBuilder(
            status: drawerStatus,
            drawer: CustomDrawer(),
            screenContents: HomeScreen()),

        //  bottomNavigationBar: AppBottomNav(),
      ),
    ]);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          CustomBody(),
          Homebody(),
        ],
      ),
    );
  }
}

class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 320),
        child: Column(
          children: <Widget>[
            FadeAnimation(
              1.2,
              Items(
                  name: " Live Location Map",
                  image: 'assets/User/location.jpg',
                  path: Usertrainmap()),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              1.5,
              Items(
                  name: "Trains on tracks ",
                  image: 'assets/User/item2.jpg',
                  path: Userrunning()),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              1.8,
              Items(
                  name: "Schedules",
                  image: 'assets/User/table.jpg',
                  path: Searchtrain()),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              1.8,
              Items(
                  name: "Route Details",
                  image: 'assets/User/214.png',
                  path: Usertrainmap()),
            ),
          ],
        ));
  }
}

class Items extends StatelessWidget {
  final name, des, image, path;

  const Items({Key key, this.name, this.des, this.image, this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            (context), MaterialPageRoute(builder: (context) => path));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 120.0,
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class Homebody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(top: 340),
//         child: Column(
//           children: <Widget>[
//             Card(
//               title: "Live location Map",
//             ),
//             Card(
//               title: "Trains on tracks",
//             ),
//             Card(
//               title: "Train Schdules",
//             ),
//           ],
//         ));
//   }
// }

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
          height: 180,
          padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Where is the train",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
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
                      Colors.amberAccent.withOpacity(0.4),
                      BlendMode.darken,
                    ))),
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
                        TextSpan(text: title, style: TextStyle(fontSize: 16))
                      ])),
                )),
          ),
        )
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("0765694916")
                ],
              )),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
            leading: Icon(Icons.person),
            title: Text(
              "Your Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: Icon(Icons.payment),
            title: Text("Payments"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              FirebaseAuth.instance.signOut();
              // await auth.signOut();
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Signin()),
              // );
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Version 1.0.0"),
                  Text("Developed By Group 28")
                ],
              ))
        ],
      ),
    );
  }
}
