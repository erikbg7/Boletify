import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.warning_amber_rounded, size: 40),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              "BoletusAI es una aplicació experimental. Utilitza les teves fonts d'informació habituals per saber si el bolet es comestible o tòxic.",
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}