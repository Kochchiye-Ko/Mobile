import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class UsersAdminpanel extends StatefulWidget {
  @override
  _UsersAdminpanelState createState() => _UsersAdminpanelState();
}

class _UsersAdminpanelState extends State<UsersAdminpanel> {
  bool toggle = false;
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
    Colors.purple,
    Colors.brown,
    Colors.lightGreen,
    Colors.orange,
    Colors.redAccent,
    Colors.blueGrey,
    Colors.deepOrange,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("January", () => 5);
    dataMap.putIfAbsent("February", () => 3);
    dataMap.putIfAbsent("March", () => 2);
    dataMap.putIfAbsent("April", () => 2);
    dataMap.putIfAbsent("May", () => 5);
    dataMap.putIfAbsent("June", () => 9);
    dataMap.putIfAbsent("July", () => 2);
    dataMap.putIfAbsent("August", () => 2);
    dataMap.putIfAbsent("September", () => 5);
    dataMap.putIfAbsent("October", () => 9);
    dataMap.putIfAbsent("November", () => 2);
    dataMap.putIfAbsent("December", () => 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[calculateMonths()],
      ),
    );
  }

  Widget calculateMonths() {
    return Stack(
      children: <Widget>[
        StreamBuilder(
          stream: Firestore.instance.collection('UserTB').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Container(
                  child: Text("No data found!"),
                ),
              );

            for (int i = 0; i < snapshot.data.documents.length; i++) {
              var user = snapshot.data.documents[i];
              print("Dilanka");
              print(user['firstname']);
              if (user['firstname'] != null || user['accountType'] != null) {
                print("object");
              } else {}
            }
          },
        ),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Users"),
//         backgroundColor: Colors.grey[900],
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               image: new DecorationImage(
//                 image: new AssetImage("assets/User/userbgdark.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             height: double.infinity,
//             child: SingleChildScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
//               child: Form(
//                 child: Column(
//                   children: <Widget>[
//                     // StreamBuilder(
//                     //   stream:
//                     //       Firestore.instance.collection('UserTB').snapshots(),
//                     //   builder: (context, snapshot) {
//                     //     if (!snapshot.hasData) {
//                     //       return Center(
//                     //           child: CircularProgressIndicator(
//                     //               backgroundColor: Colors.purpleAccent));
//                     //     }
//                     //     for (int i = 0;
//                     //         i < snapshot.data.documents.length;
//                     //         i++) {
//                     //       var data = snapshot.data.documents[i];
//                     //       print("Dilanka");
//                     //     }
//                     //   },
//                     // ),
//                     SingleChildScrollView(
//                       padding: EdgeInsets.only(top: 25),
//                       child: PieChart(
//                         dataMap: dataMap,
//                         legendFontColor: Colors.white,
//                         legendFontSize: 8.0,
//                         legendFontWeight: FontWeight.w500,
//                         animationDuration: Duration(milliseconds: 800),
//                         chartLegendSpacing: 35.0,
//                         chartRadius: MediaQuery.of(context).size.width / 2,
//                         showChartValuesInPercentage: true,
//                         showChartValues: false,
//                         showChartValuesOutside: true,
//                         chartValuesColor: Colors.white.withOpacity(0.9),
//                         colorList: colorList,
//                         showLegends: true,
//                         decimalPlaces: 1,
//                         showChartValueLabel: false,
//                         chartValueFontSize: 10,
//                         chartValueFontWeight: FontWeight.bold,
//                         chartValueLabelColor: Colors.grey[200],
//                         initialAngle: 0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
