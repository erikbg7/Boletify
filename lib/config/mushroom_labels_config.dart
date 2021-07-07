import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

Map<SearchLabels, MushroomLabel> mushroomLabels = {
  SearchLabels.spring: MushroomLabel(
    imageUrl: 'assets/season/spring.png',
    tooltip: 'Temporada de primavera',
    label: 'Primavera',
    colors: [Colors.pink, Colors.purple],
  ),
  SearchLabels.summer: MushroomLabel(
    imageUrl: 'assets/season/summer.png',
    tooltip: "Temporada d'estiu",
    label: 'Estiu',
    colors: [Colors.yellow, Colors.orange],
  ),
  SearchLabels.autumn: MushroomLabel(
    imageUrl: 'assets/season/autum.png',
    tooltip: "Temporada de tardor",
    label: 'Tardor',
    colors: [Colors.orange, Colors.red],
  ),
  SearchLabels.winter: MushroomLabel(
    imageUrl: 'assets/season/winter.png',
    tooltip: "Temporada d'hivern",
    label: 'Hivern',
    colors: [Colors.blue, Colors.green],
  ),
  SearchLabels.edible: MushroomLabel(
    imageUrl: 'assets/edibility/edible.png',
    tooltip: 'Bon comestible',
    label: 'Comestible',
    colors: [Colors.green, Colors.greenAccent],
  ),
  SearchLabels.toxic: MushroomLabel(
    imageUrl: 'assets/edibility/toxic.png',
    tooltip: 'Toxic, aluciogen o mortal',
    label: 'Tóxic',
    colors: [Colors.yellow, Colors.grey],
  ),
  SearchLabels.unknown: MushroomLabel(
    imageUrl: 'assets/edibility/unknown.png',
    tooltip: 'Desconegut o sense informació',
    label: 'Desconegut',
    colors: [Colors.grey, Colors.black],
  )
};
