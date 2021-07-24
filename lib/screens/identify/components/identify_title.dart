import 'package:flutter/material.dart';

class IdentifyTitle extends StatelessWidget {
  final String text;

  const IdentifyTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 37,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}