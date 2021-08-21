import 'package:flutter/material.dart';

class ScaffoldBoletify extends StatelessWidget {
  final Widget body;
  final Widget bottomNavBar;

  const ScaffoldBoletify(
      {Key? key, required this.body, required this.bottomNavBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body,
          Positioned(
            bottom: 0,
            left: 0,
            child: bottomNavBar,
          ),
        ],
      ),
    );
  }
}
