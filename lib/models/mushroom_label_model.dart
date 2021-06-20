import 'package:flutter/material.dart';

class MushroomLabel {
  final String imageUrl;
  final String tooltip;
  final List<Color> colors;

  MushroomLabel({this.imageUrl, this.tooltip, this.colors});
}

enum SearchLabels { spring, summer, autumn, winter, edible, toxic, unknown }

Map<SearchLabels, MushroomLabel> mushroomLabels = {
  SearchLabels.spring: MushroomLabel(
    imageUrl: 'assets/season/spring.png',
    tooltip: 'Temporada de primavera',
    colors: [Colors.pink, Colors.purple],
  ),
  SearchLabels.summer: MushroomLabel(
    imageUrl: 'assets/season/summer.png',
    tooltip: "Temporada d'estiu",
    colors: [Colors.yellow, Colors.orange],
  ),
  SearchLabels.autumn: MushroomLabel(
    imageUrl: 'assets/season/autum.png',
    tooltip: "Temporada de tardor",
    colors: [Colors.orange, Colors.red],
  ),
  SearchLabels.winter: MushroomLabel(
    imageUrl: 'assets/season/winter.png',
    tooltip: "Temporada d'hivern",
    colors: [Colors.blue, Colors.green],
  ),
  SearchLabels.edible: MushroomLabel(
    imageUrl: 'assets/edibility/edible.png',
    tooltip: 'Bon comestible',
    colors: [Colors.green, Colors.greenAccent],
  ),
  SearchLabels.toxic: MushroomLabel(
    imageUrl: 'assets/edibility/toxic.png',
    tooltip: 'Toxic, aluciogen o mortal',
    colors: [Colors.yellow, Colors.grey],
  ),
  SearchLabels.unknown: MushroomLabel(
    imageUrl: 'assets/edibility/unknown.png',
    tooltip: 'Desconegut o sense informació',
    colors: [Colors.grey, Colors.black],
  )
};
