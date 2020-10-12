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
      appBar: AppBar(
        title: Text("Search Trains"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Orgin:- ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // value: dropdown4EndStaion,
                      icon: Icon(Icons.arrow_downward, color: Colors.black),
                      iconSize: 24,
                      elevation: 0,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.grey[800],
                      // ),
                      // dropdownColor: Colors.grey[900],
                      onChanged: (String newValue) {
                        setState(() {
                          // dropdown4EndStaion = newValue;
                        });
                      },
                      items: <String>[
                        "Select Staion",
                        'Colombo Fort',
                        'Maradana ',
                        'Ragama ',
                        'Gampaha ',
                        'Veyangoda',
                        'Polgahawela',
                        'Rambukkana',
                        'Peradeniya',
                        'Nawalapitiya',
                        'Hatton',
                        'Nanu Oya ',
                        'Bandarawela',
                        'Badulla',
                        'Kandy',
                        'Katugastota',
                        'Matale',
                        'Negombo',
                        'Chilaw',
                        'Puttalam ',
                        'Avissawella',
                        'Anuradhapura ',
                        'Vavuniya',
                        'Kilinochchi',
                        'Kodikamamam',
                        'Chavakachcheri',
                        'Jaffna',
                        'Kankesanthurai',
                        'Medawachchiya',
                        'Mannar',
                        'Talaimannar',
                        'Maho',
                        'Polonnaruwa',
                        'Valaichchenai',
                        'Kollupitiya',
                        'Moratuwa',
                        'Panadura',
                        'Aluthgama',
                        'Bentota',
                        'Balapitiya',
                        'Ambalangoda',
                        'Hikkaduwa',
                        'Galle',
                        'Matara',
                        'Hambantota ',
                        'Beliatta ',
                        'Kataragama ',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Destination:- ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      // value: dropdown4EndStaion,
                      icon: Icon(Icons.arrow_downward, color: Colors.black),
                      iconSize: 24,
                      elevation: 0,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.grey[800],
                      // ),
                      // dropdownColor: Colors.grey[900],
                      onChanged: (String newValue) {
                        setState(() {
                          // dropdown4EndStaion = newValue;
                        });
                      },
                      items: <String>[
                        "Select Staion",
                        'Colombo Fort',
                        'Maradana ',
                        'Ragama ',
                        'Gampaha ',
                        'Veyangoda',
                        'Polgahawela',
                        'Rambukkana',
                        'Peradeniya',
                        'Nawalapitiya',
                        'Hatton',
                        'Nanu Oya ',
                        'Bandarawela',
                        'Badulla',
                        'Kandy',
                        'Katugastota',
                        'Matale',
                        'Negombo',
                        'Chilaw',
                        'Puttalam ',
                        'Avissawella',
                        'Anuradhapura ',
                        'Vavuniya',
                        'Kilinochchi',
                        'Kodikamamam',
                        'Chavakachcheri',
                        'Jaffna',
                        'Kankesanthurai',
                        'Medawachchiya',
                        'Mannar',
                        'Talaimannar',
                        'Maho',
                        'Polonnaruwa',
                        'Valaichchenai',
                        'Kollupitiya',
                        'Moratuwa',
                        'Panadura',
                        'Aluthgama',
                        'Bentota',
                        'Balapitiya',
                        'Ambalangoda',
                        'Hikkaduwa',
                        'Galle',
                        'Matara',
                        'Hambantota ',
                        'Beliatta ',
                        'Kataragama ',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Trainview();
                  }),
            ),
          ],
        ),
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade400,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    children: List.generate(
                                      (constraints.constrainWidth() / 10)
                                          .floor(),
                                      (index) => SizedBox(
                                        height: 1,
                                        width: 3,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade800),
                                        ),
                                      ),
                                    ),
                                    direction: Axis.horizontal,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  );
                                },
                              ),
                            ),
                            Center(
                                child: Icon(
                              Icons.directions_transit,
                              color: Colors.green.shade400,
                              size: 24,
                            ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade400,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Anuradhapura",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Origin",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "5H 30M",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Destination",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "08:00 AM",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "02:30 PM",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.train,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Intercity",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
