import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: BoletifyColors.green900,
      appBarTheme: AppBarTheme(color: BoletifyColors.green900, shadowColor: Colors.transparent),
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
