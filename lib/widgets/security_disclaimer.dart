import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityDisclaimer extends StatelessWidget {
  static const message =
      "Boletify es una aplicació experimental. Utilitza les teves fonts d'informació habituals per saber si el bolet es comestible o tòxic.";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.15,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      padding: EdgeInsets.all(10),
      color: Colors.grey.withOpacity(0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.warning_amber_rounded, size: 40, color: Colors.redAccent),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              softWrap: true,
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
