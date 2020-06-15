import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainShedule extends StatefulWidget {
  @override
  TrainSheduleState createState() => TrainSheduleState();
}

class TrainSheduleState extends State<TrainShedule> {
  final _formKey = GlobalKey<FormState>();
  String firstNme, lastName, email;
  String dropdown1Value = "Select Train type";
  String dropdown2Value = "Select Time";
  String dropdown3StartStaion = "Select Start Staion";
  String dropdown4EndStaion = "Select End Staion";
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
            style: TextStyle(color: Colors.blue[200]),
            onChanged: (val) {
              setState(() {});
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
            style: TextStyle(color: Colors.blue[200]),
            onChanged: (val) {
              setState(() {});
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
          child: Text('Choose Start Time'),
          color: Colors.grey[300],
          onPressed: () async {
            final selectedTime = await _selectTime(context);
            if (selectedTime == null) return;
            print(selectedTime);

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
          child: Text('Choose Start Time'),
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
            SizedBox(
              width: 20.0,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[600]),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 75.0, right: 75.0),
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {}
                        },
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
