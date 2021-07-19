import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class DetailLabels extends StatelessWidget {
  final List<SearchLabels> labels;
  final MainAxisAlignment alignment;
  final bool small;

  const DetailLabels(
      {Key? key,
      required this.labels,
      this.small = false,
      this.alignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labels.isEmpty) {
      final unknownLabel = mushroomLabels[SearchLabels.unknown]!;
      return CustomIcon(
        image: unknownLabel.imageUrl,
        tooltip: unknownLabel.tooltip,
        size: 50,
      );
    }

    List<Widget> labelsList = [];

    labels.forEach((label) {
      if (mushroomLabels.containsKey(label)) {
        MushroomLabel labelInfo = mushroomLabels[label]!;
        labelsList.add(CustomIcon(
          image: labelInfo.imageUrl,
          tooltip: labelInfo.tooltip,
          size: small ? 15 : 50,
        ));
      }
    });

    return Row(
      children: labelsList,
      mainAxisAlignment: alignment,
    );
  }
}

MushroomLabel getInfoByTag(SearchLabels label) {
  return mushroomLabels.entries
      .firstWhere((element) => element.key == label)
      .value;
//  if (mushroomLabels.containsKey(label)) {
//    return mushroomLabels.entries.firstWhere((element) => element.key == label).value;
//  }
//  return mushroomLabels.entries.firstWhere((element) => element.key == SearchLabels.unknown).value;
}
