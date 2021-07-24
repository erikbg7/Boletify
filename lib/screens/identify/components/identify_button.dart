import 'dart:ui';

import 'package:flutter/material.dart';

class IdentifyButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;

  const IdentifyButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black.withOpacity(0.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 50),
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(text,
                        style: Theme.of(context).textTheme.headline3))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
