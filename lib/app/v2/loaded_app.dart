import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:futter_project_tfg/app/v2/app_navigation.dart';
import 'package:futter_project_tfg/screens/identify/identify_screen.dart';

class LoadedApp extends StatefulWidget {
  const LoadedApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadedAppState();
}

class _LoadedAppState extends State<LoadedApp> {
  int _currentTabIndex = 0;

  onTap(int index) {
    setState(() => _currentTabIndex = index);
  }

  onPressed() {
    final AppBar appBar = AppBar(title: Text('Nova identificació'));
    final Widget body = IdentifyScreen();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(appBar: appBar, body: body);
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
//        backgroundColor: Colors.white70,
        backgroundColor: Colors.blueGrey,
        onPressed: onPressed,
        child:
//        Container(
//          margin: EdgeInsets.all(10),
//          decoration: BoxDecoration(
//            color: Colors.greenAccent,
//            borderRadius: BorderRadius.all(Radius.circular(300.0)),
//          ),
//          child: Image.asset('assets/brand/boletify_identify_black copy.png'),
//        ),
//        child: Image.asset('assets/brand/boletify_identify.png')
            const Icon(Icons.photo_camera, color: Colors.white, size: 37),
      ),
    );
  }
}
