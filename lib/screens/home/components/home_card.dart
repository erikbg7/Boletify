import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class HomeCard extends StatelessWidget {
  final SearchLabels label;

  const HomeCard({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mushroom = mushroomLabels[label];
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 125,
      width: size.width*0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.2, 1],
              colors: mushroom.colors)),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          CustomIcon(
            image: mushroom.imageUrl,
            tooltip: mushroom.tooltip,
            size: 25,
          ),
          Center(child: Text(mushroom.tooltip, textAlign: TextAlign.center,)),
        ],
      ),
    );
  }
}
