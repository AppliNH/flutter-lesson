import 'package:flutter/material.dart';
import 'package:learnflutter/styles/colors.dart';

ThemeData lightTheme = new ThemeData(
  backgroundColor: myWhite,
  fontFamily: 'roboto',
  primarySwatch: Colors.blue,
  accentColor:Colors.indigo,
  canvasColor: Color.fromRGBO(255,254,229,1),
  
);

ThemeData darkTheme = new ThemeData(
  backgroundColor: myDark,
  fontFamily: 'roboto',
  primarySwatch: Colors.blue
);