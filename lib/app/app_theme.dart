import 'package:flutter/material.dart';

// Interesting colors to work with
//  Green floating button Color(0xFF00B47B),

ThemeData buildThemeData() {
  return ThemeData(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Color(0xFF202020),
//      scaffoldBackgroundColor: Color(0xFF112523),
      appBarTheme: AppBarTheme(color: Color(0xFF202020), shadowColor: Colors.transparent),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          highlightElevation: 10.0,
          elevation: 10.0,
          backgroundColor: Colors.grey[700],
          ),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.grey[200], fontSize: 38),
        headline3: TextStyle(color: Colors.grey[200], fontSize: 22),
        headline4: TextStyle(color: Colors.grey[200], fontSize: 17),
        headline5: TextStyle(color: Colors.grey[200], fontSize: 15),
      ));
}
