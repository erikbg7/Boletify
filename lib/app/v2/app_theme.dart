import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: BoletifyColors.green900,
    appBarTheme: AppBarTheme(
      color: BoletifyColors.green900,
      shadowColor: Colors.transparent,
    ),
  );
}
