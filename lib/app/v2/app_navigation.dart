import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/home/home_screen.dart';
import 'package:futter_project_tfg/screens/settings/settings_screen.dart';

Container buildBottomNavBar(Function(int) onTap, int currentIndex) {
  return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
          ),
        ],
      ),
      child: BottomNavigationBar(
          backgroundColor: Colors.black,
//          backgroundColor: Color(0XFF131313),
          selectedItemColor: Color(0XFFF9F9F9),
          unselectedItemColor: Color(0X99F9F9F9),
          items: _navBarItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTap));
}

final _navBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inici'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Opcions'),
];

final appPages = <Widget>[
  HomeScreen(),
  SettingsScreen(),
];
