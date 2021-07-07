import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:futter_project_tfg/app/app_navigation.dart';
import 'package:futter_project_tfg/screens/identify/identify_screen.dart';

class LoadedApp extends StatefulWidget {
  const LoadedApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadedAppState();
}

class _LoadedAppState extends State<LoadedApp> {
  int _currentTabIndex = 0;

  onTap(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('Nova identificació')),
            body: IdentifyScreen(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appPages[_currentTabIndex],
      bottomNavigationBar: buildBottomNavBar(onTap, _currentTabIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.photo_camera,
          color: Colors.white,
          size: 37,
        ),
      ),
    );
  }
}
