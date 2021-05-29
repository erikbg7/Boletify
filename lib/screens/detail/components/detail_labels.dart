import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

//enum MushroomLabelType {spring, summer, autum, winter, edible, toxic, unknown}

Map<String, MushroomLabel> mushroomLabels = {
  'spring': MushroomLabel(
    imageUrl: 'assets/season/spring.png',
    tooltip: 'Temporada de primavera',
  ),
  'summer': MushroomLabel(
    imageUrl: 'assets/season/summer.png',
    tooltip: "Temporada d'estiu",
  ),
  'autum': MushroomLabel(
    imageUrl: 'assets/season/autum.png',
    tooltip: "Temporada de tardor",
  ),
  'winter': MushroomLabel(
    imageUrl: 'assets/season/winter.png',
    tooltip: "Temporada d'hivern",
  ),
  'edible': MushroomLabel(
    imageUrl: 'assets/edibility/edible.png',
    tooltip: 'Bon comestible',
  ),
  'toxic': MushroomLabel(
    imageUrl: 'assets/edibility/toxic.png',
    tooltip: 'Toxic, aluciogen o mortal',
  ),
  'unknown': MushroomLabel(
    imageUrl: 'assets/edibility/unknown.png',
    tooltip: 'Desconegut o sense informació',
  )
};

class DetailLabels extends StatelessWidget {
  final List<String> labels;
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
