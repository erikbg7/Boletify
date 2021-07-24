import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_icon.dart';

class HomeIconsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.265,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          HomeIcon(tag: Tag.edible),
          HomeIcon(tag: Tag.toxic),
          HomeIcon(tag: Tag.spring),
          HomeIcon(tag: Tag.summer),
          HomeIcon(tag: Tag.autumn),
          HomeIcon(tag: Tag.winter),
        ],
      ),
    );
  }
}