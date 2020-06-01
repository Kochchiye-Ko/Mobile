import 'package:flutter/material.dart';

class Searchtrain extends StatefulWidget {
  @override
  _SearchtrainState createState() => _SearchtrainState();
}

class _SearchtrainState extends State<Searchtrain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Trainview(),
      ),
    );
  }
}

class Trainview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Colombo Fort",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    Container(
                      padding:EdgeInsets.all(8) ,
                      decoration: BoxDecoration(
                         color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(decoration: BoxDecoration(
                          color: Colors.indigo.shade400,
                          borderRadius: BorderRadius.circular(5)
                        ),),
                      ),
                    ),
                    Text(
                      "Anuradhapura",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.grey.shade200),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Flex(
                        children: List.generate(
                          (constraints.constrainWidth() / 10).floor(),
                          (index) => SizedBox(
                            height: 1,
                            width: 5,
                            child: DecoratedBox(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.grey.shade200),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          )
        ],
      ),
    );
  }
}
