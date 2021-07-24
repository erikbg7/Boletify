import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

final TagInfo springMushroomInfo = TagInfo(
  imageUrl: 'assets/season/spring.png',
  tooltip: 'Temporada de primavera',
  label: 'Primavera',
  colors: [Colors.pink, Colors.purple],
);

final TagInfo summerMushroomInfo = TagInfo(
  imageUrl: 'assets/season/summer.png',
  tooltip: "Temporada d'estiu",
  label: 'Estiu',
  colors: [Colors.yellow, Colors.orange],
);

final TagInfo autumnMushroomInfo = TagInfo(
  imageUrl: 'assets/season/autum.png',
  tooltip: "Temporada de tardor",
  label: 'Tardor',
  colors: [Colors.orange, Colors.red],
);

final TagInfo winterMushroomInfo = TagInfo(
  imageUrl: 'assets/season/winter.png',
  tooltip: "Temporada d'hivern",
  label: 'Hivern',
  colors: [Colors.blue, Colors.green],
);

final TagInfo edibleMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/edible.png',
  tooltip: 'Bon comestible',
  label: 'Comestible',
  colors: [Colors.green, Colors.greenAccent],
);

final TagInfo toxicMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/toxic.png',
  tooltip: 'Toxic, aluciogen o mortal',
  label: 'Tóxic',
  colors: [Colors.yellow, Colors.grey],
);

final TagInfo unknownMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/unknown.png',
  tooltip: 'Desconegut o sense informació',
  label: 'Desconegut',
  colors: [Colors.grey, Colors.black],
);

TagInfo infoFromTag(Tag tag) {
  switch (tag) {
    case Tag.spring:
      return springMushroomInfo;
    case Tag.summer:
      return summerMushroomInfo;
    case Tag.autumn:
      return autumnMushroomInfo;
    case Tag.winter:
      return winterMushroomInfo;
    case Tag.edible:
      return edibleMushroomInfo;
    case Tag.toxic:
      return toxicMushroomInfo;
    default:
      return unknownMushroomInfo;
  }
}
