import 'package:flutter/material.dart';

class IdentifyTitle extends StatelessWidget {
  final String text;

  const IdentifyTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 10,left: 10, right: 10),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.grey[200],
            fontSize: 40,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
