import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:futter_project_tfg/colors.dart';
import 'package:futter_project_tfg/app/app_navigation.dart';
import 'package:futter_project_tfg/screens/identify/identify_screen.dart';
import 'package:futter_project_tfg/widgets/bottom_navigation_bar_boletify.dart';
import 'package:futter_project_tfg/widgets/scaffold_boletify.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => IdentifyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
//        statusBarColor: BoletifyColors.skyBlue,
        systemNavigationBarColor: BoletifyColors.bottomNavBar,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return ScaffoldBoletify(
      body: appPages[_currentTabIndex],
      bottomNavBar: BottomNavigationBarBoletify(
        onTapBarItem: onTap,
        currentIndex: _currentTabIndex,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.photo_camera, size: 35),
          elevation: 0.1,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
