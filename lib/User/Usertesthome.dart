import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Usertesthome extends StatefulWidget {
  @override
  _UsertesthomeState createState() => _UsertesthomeState();
}

class _UsertesthomeState extends State<Usertesthome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/User/userbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {},
            ),
            title: RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    children: [
                  //   TextSpan(
                  //    text: "කෝච්ච්ය කෝ",
                  //   style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: "Where is the train",
                      style: TextStyle(color: Colors.white))
                ])),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                ),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Color(0xFF333231).withOpacity(0.7),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Card(),
                SizedBox(
                  height: 5,
                ),
                Card(),
                SizedBox(
                  height: 10,
                ),
                Card(),
                Card()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key key,
  }) : super(key: key);

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
                child: RichText(text: TextSpan(
                      style: TextStyle(color:Colors.white),
                      children: [TextSpan(text:"See Live location",style: TextStyle(fontSize: 16))]
                    )),
              )
                
              
            ),
          ),
        )
      ],
    );
  }
}
