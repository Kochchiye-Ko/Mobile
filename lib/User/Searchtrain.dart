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
          ),
         Container(
           color:Colors.white,
           child:   Row(
            children: <Widget>[
              SizedBox(height: 20,
              width: 10,
              child: DecoratedBox(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              )),),
              Expanded(
                              child: LayoutBuilder(builder:(context,constraints){
                  return Flex(children: List.generate((constraints.constrainWidth()/10).floor(), (index)=>SizedBox(height: 1,width:5 ,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade800),),),
                  ),
                  direction:Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,);
                },),
              ),
            ],
          ),
         ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
          )
        ],
      ),
    );
  }
}
