import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  final Color? color;
  final double size;

  const CustomIcon(
      {Key? key, required this.image, this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: size,
      height: size,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image)),
          color: color ?? null),
    );
  }
}
