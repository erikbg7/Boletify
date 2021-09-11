import 'package:flutter/material.dart';

class DetailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/forest.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
