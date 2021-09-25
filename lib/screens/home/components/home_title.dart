import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Image.asset('assets/brand/boletify_title.png', height: 40)
    );
  }
}
