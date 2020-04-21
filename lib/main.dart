import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: App(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Age Calculator',
            style: TextStyle(color: Colors.grey[800]),
          ),
          backgroundColor: Color(0xFFffd700),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _value = '';
  Duration ageDuration;
  int ageInDays;
  int age;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1950),
      lastDate: new DateTime(2021),
    );
    if (picked != null)
      setState(() {
        _value = picked.toString();
        ageDuration = DateTime.now().difference(picked);
        ageInDays = ageDuration.inDays;
        age = ageInDays ~/ 365.25;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your age is $age',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
//          Text(
//            '$_value',
//            style: TextStyle(color: Colors.white),
//          ),
          FlatButton(
            onPressed: _selectDate,
            child: Text(
              'Select DOB',
              style: TextStyle(color: Colors.white),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
              side: BorderSide(
                color: Color(0xFFffd700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
