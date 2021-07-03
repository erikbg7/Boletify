import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_icon.dart';

class HomeIconsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          HomeIcon(label: SearchLabels.edible),
          HomeIcon(label: SearchLabels.toxic),
          HomeIcon(label: SearchLabels.spring),
          HomeIcon(label: SearchLabels.summer),
          HomeIcon(label: SearchLabels.autumn),
          HomeIcon(label: SearchLabels.winter),
        ],
      ),
    );
  }
}