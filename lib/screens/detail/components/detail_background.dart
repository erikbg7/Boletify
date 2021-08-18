import 'package:flutter/material.dart';

class DetailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/forest.jpeg'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
