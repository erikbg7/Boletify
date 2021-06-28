import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.warning_amber_rounded, size: 40, color: Colors.greenAccent,),
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