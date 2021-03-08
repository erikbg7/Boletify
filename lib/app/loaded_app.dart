import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:futter_project_tfg/app/app_navigation.dart';
import 'package:futter_project_tfg/app/app_theme.dart';

class LoadedApp extends StatefulWidget {
  const LoadedApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadedAppState();
}

class _LoadedAppState extends State<LoadedApp> {
  int _currentTabIndex = 0;

  Function onTap(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boletus AI',
        theme: buildThemeData(),
        home: Scaffold(
          body: appPages[_currentTabIndex],
          bottomNavigationBar: buildBottomNavBar(onTap, _currentTabIndex)
        ));
  }
}
