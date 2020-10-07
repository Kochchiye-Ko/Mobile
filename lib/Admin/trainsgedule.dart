import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kochchiye_ko/Admin/database/database.dart';

class TrainShedule extends StatefulWidget {
  @override
  TrainSheduleState createState() => TrainSheduleState();
}

class TrainSheduleState extends State<TrainShedule> {
  final _formKey = GlobalKey<FormState>();
  final nameHolder1 = TextEditingController();
  final nameHolder2 = TextEditingController();
  String _trainNumber = "";
  String _trainName = "";
  String dropdown1Value = "Select Train type";
  String dropdown2Value = "Select Time";
  String dropdown3StartStaion = "Select Start Staion";
  String dropdown4EndStaion = "Select End Staion";
  String dropdown5selectStaion = "Select Staion";
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  final DateFormat dateFormat = DateFormat('HH:mm');

  trainNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Train Number',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            validator: (val) => val.isEmpty ? 'Enter Train Number' : null,
            decoration: InputDecoration(
              fillColor: Colors.black.withOpacity(0.2),
              filled: true,
              hintText: "Train Number",
            ),
            controller: nameHolder1,
            style: TextStyle(color: Colors.blue[200]),
            onChanged: (val) {
              setState(() {
                this._trainNumber = val;
              });
            },
          ),
        ),
      ],
    );
  }

  trainName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Train Name',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.black.withOpacity(0.2),
              filled: true,
              hintText: "Train Name",
            ),
            controller: nameHolder2,
            style: TextStyle(color: Colors.blue[200]),
            onChanged: (val) {
              setState(() {
                this._trainName = val;
              });
            },
          ),
        ),
      ],
    );
  }

  trainType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Train Type',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: dropdown1Value,
          icon: Icon(Icons.arrow_downward, color: Colors.blue[200]),
          iconSize: 24,
          elevation: 0,
          style: TextStyle(color: Colors.blue[200], fontSize: 18.0),
          underline: Container(
            height: 2,
            color: Colors.grey[800],
          ),
          dropdownColor: Colors.grey[900],
          onChanged: (String newValue) {
            setState(() {
              dropdown1Value = newValue;
            });
          },
          items: <String>[
            "Select Train type",
            'Express',
            'Intercity',
            'Long Distance',
            'Night',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  trainTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Train Time',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: dropdown2Value,
          icon: Icon(Icons.arrow_downward, color: Colors.blue[200]),
          iconSize: 24,
          elevation: 0,
          style: TextStyle(color: Colors.blue[200], fontSize: 18.0),
          underline: Container(
            height: 2,
            color: Colors.grey[800],
          ),
          dropdownColor: Colors.grey[900],
          onChanged: (String newValue) {
            setState(() {
              dropdown2Value = newValue;
            });
          },
          items: <String>[
            "Select Time",
            'Daily',
            'weekend',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  startStaion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Start Staion',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: dropdown3StartStaion,
          icon: Icon(Icons.arrow_downward, color: Colors.blue[200]),
          iconSize: 24,
          elevation: 0,
          style: TextStyle(color: Colors.blue[200], fontSize: 18.0),
          underline: Container(
            height: 2,
            color: Colors.grey[800],
          ),
          dropdownColor: Colors.grey[900],
          onChanged: (String newValue) {
            setState(() {
              dropdown3StartStaion = newValue;
            });
          },
          items: <String>[
            "Select Start Staion",
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
      ],
    );
  }

  endStaion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'End Staion',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: dropdown4EndStaion,
          icon: Icon(Icons.arrow_downward, color: Colors.blue[200]),
          iconSize: 24,
          elevation: 0,
          style: TextStyle(color: Colors.blue[200], fontSize: 18.0),
          underline: Container(
            height: 2,
            color: Colors.grey[800],
          ),
          dropdownColor: Colors.grey[900],
          onChanged: (String newValue) {
            setState(() {
              dropdown4EndStaion = newValue;
            });
          },
          items: <String>[
            "Select End Staion",
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
      ],
    );
  }

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  String selectstartTime = "";

  startTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          dateFormat.format(selectedDate1),
          style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black.withOpacity(0.2)),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)),
          child: Text('Choose Start Time'),
          color: Colors.grey[300],
          onPressed: () async {
            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);
            // selectstartTime = selectedTime.toString();
            setState(() {
              this.selectedDate1 = DateTime(
                selectedDate1.year,
                selectedDate1.month,
                selectedDate1.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
          },
        ),
      ],
    );
  }

  endTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          dateFormat.format(selectedDate2),
          style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black.withOpacity(0.2)),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black),
          ),
          child: Text('Choose End Time  '),
          color: Colors.grey[300],
          onPressed: () async {
            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);
            setState(() {
              this.selectedDate2 = DateTime(
                selectedDate2.year,
                selectedDate2.month,
                selectedDate2.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
          },
        ),
      ],
    );
  }

  buttonrow() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                startTime(),
              ],
            ),
            Column(
              children: <Widget>[
                endTime(),
              ],
            )
          ],
        ),
      ],
    );
  }

  _viewSubtrainStations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.grey[300].withOpacity(0.1),
          margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
          child: ListTile(
            title: Text(""),
            subtitle: Text(
              "",
              style: TextStyle(color: Colors.blueGrey, height: 10.0),
            ),
          ),
        ),
      ],
    );
  }

  _insertSubtrainStations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.grey[300].withOpacity(0.1),
          margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
          child: Row(
            children: <Widget>[
              DropdownButton<String>(
                isExpanded: false,
                value: dropdown5selectStaion,
                icon: Icon(Icons.arrow_downward, color: Colors.blue[200]),
                iconSize: 24,
                elevation: 0,
                style: TextStyle(color: Colors.blue[200], fontSize: 18.0),
                underline: Container(
                  height: 2,
                  color: Colors.grey[800],
                ),
                dropdownColor: Colors.grey[900],
                onChanged: (String newValue) {
                  setState(() {
                    dropdown5selectStaion = newValue;
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
              Row(
                children: <Widget>[
                  endTime(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/User/userbgdark.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 40.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "ADD TRAIN DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 3.0,
                              color: Colors.brown[800],
                            ),
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Colors.brown[400],
                            ),
                          ],
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    trainNumber(),
                    SizedBox(
                      height: 10.0,
                    ),
                    trainName(),
                    SizedBox(
                      height: 10.0,
                    ),
                    trainType(),
                    SizedBox(
                      height: 10.0,
                    ),
                    trainTime(),
                    SizedBox(
                      height: 10.0,
                    ),
                    startStaion(),
                    SizedBox(
                      height: 10.0,
                    ),
                    endStaion(),
                    SizedBox(
                      height: 10.0,
                    ),
                    buttonrow(),
                    SizedBox(
                      height: 10.0,
                    ),
                    // _insertSubtrainStations(),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // _viewSubtrainStations(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: ButtonTheme(
                        height: 50.0,
                        minWidth: 150.0,
                        child: RaisedButton.icon(
                          icon: Icon(
                            Icons.train,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.orange[100])),
                          color: Colors.orange,
                          label: Center(
                            child: Text(
                              "Add a train",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              DatabaseService().addTrains(
                                  _trainNumber,
                                  _trainName,
                                  dropdown1Value,
                                  dropdown2Value,
                                  dropdown3StartStaion,
                                  dropdown4EndStaion,
                                  selectedDate1.toString(),
                                  selectedDate2.toString());

                              nameHolder1.clear();
                              nameHolder2.clear();
                              setState(() {
                                this.dropdown1Value = "Select Train type";
                                this.dropdown2Value = "Select Time";
                                this.dropdown3StartStaion =
                                    "Select Start Staion";
                                this.dropdown4EndStaion = "Select End Staion";
                                this.dropdown5selectStaion = "Select Staion";
                                this.selectedDate1 = DateTime.now();
                                this.selectedDate2 = DateTime.now();
                              });
                            }
                          },
                        ),
                      ),
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
