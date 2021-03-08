import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      textTheme: TextTheme(
        //For AppBar
        headline1:TextStyle(color: Colors.grey[200])
      )
  );
}
