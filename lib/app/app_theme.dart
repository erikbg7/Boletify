import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.grey[200], fontSize: 38),
        headline3: TextStyle(color: Colors.grey[200], fontSize: 20),
        headline4: TextStyle(color: Colors.grey[200], fontSize: 17),
        headline5: TextStyle(color: Colors.grey[200], fontSize: 15),
      ));
}
