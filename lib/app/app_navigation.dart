import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/home/home_screen.dart';

Container buildBottomNavBar(Function onTap, int currentIndex) {
  return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
          ),
        ],
      ),
      child: BottomNavigationBar(
          backgroundColor: Color(0XFF131313),
          selectedItemColor: Color(0XFFF9F9F9),
          unselectedItemColor: Color(0X99F9F9F9),
          items: _navBarItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTap));
}

final _navBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
];

final appPages = <Widget>[
  HomeScreen(),
  HomeScreen(),
];
