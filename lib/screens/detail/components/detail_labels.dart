import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';



class DetailLabels extends StatelessWidget {
  final List<SearchLabels> labels;
  //Move icons from home screen to DetailList, send alignment CENTER as optional parameter
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  const DetailLabels({Key key, this.labels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labels.isEmpty) {
      final unknownLabel = mushroomLabels['unknown'];
      return CustomIcon(
        image: unknownLabel.imageUrl,
        tooltip: unknownLabel.tooltip,
      );
    }

    List<Widget> labelsList = [];

    labels.forEach((label) {
      if (mushroomLabels.containsKey(label)) {
        MushroomLabel labelInfo = mushroomLabels[label];
        labelsList.add(CustomIcon(
          image: labelInfo.imageUrl,
          tooltip: labelInfo.tooltip,
        ));
      }
    });

    return Row(
      children: labelsList,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
