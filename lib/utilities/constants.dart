import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kAPIkey = '48a3a0ecf9a248c5991b5694d8e252ac';

const kDecoration = InputDecoration(
  filled: true,
  icon: Icon(Icons.location_city, color: Colors.white,),
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey, ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);