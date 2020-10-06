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
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        child: SingleChildScrollView(
            // physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 50),
            child: PieChart(
              dataMap: dataMap,
              legendFontColor: Colors.blueGrey[900],
              legendFontSize: 8.0,
              legendFontWeight: FontWeight.w500,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 35.0,
              chartRadius: MediaQuery.of(context).size.width / 2,
              showChartValuesInPercentage: true,
              showChartValues: false,
              showChartValuesOutside: true,
              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
              colorList: colorList,
              showLegends: true,
              decimalPlaces: 1,
              showChartValueLabel: false,
              chartValueFontSize: 10,
              chartValueFontWeight: FontWeight.bold,
              chartValueLabelColor: Colors.grey[200],
              initialAngle: 0,
            )),
      ),
    );
  }
}
