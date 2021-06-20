import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  final String tooltip;
  final Color color;
  final double size;


  const CustomIcon({Key key, this.image, this.tooltip, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        margin: EdgeInsets.all(5),
        width: size,
        height: size,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image)), color: color ?? null),
//            BoxDecoration(image: DecorationImage(image: AssetImage(image)), color: color ?? null, borderRadius: BorderRadius.circular(300)),
      ),
    );
  }
}
