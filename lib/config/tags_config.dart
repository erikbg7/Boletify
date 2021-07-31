import 'package:futter_project_tfg/models/tag_model.dart';

final TagInfo springMushroomInfo = TagInfo(
  imageUrl: 'assets/season/spring.png',
  tooltip: 'Temporada de primavera',
  label: 'Primavera',
  tag: Tag.spring,
);

final TagInfo summerMushroomInfo = TagInfo(
  imageUrl: 'assets/season/summer.png',
  tooltip: "Temporada d'estiu",
  label: 'Estiu',
  tag: Tag.summer,
);

final TagInfo autumnMushroomInfo = TagInfo(
  imageUrl: 'assets/season/autum.png',
  tooltip: "Temporada de tardor",
  label: 'Tardor',
  tag: Tag.autumn,
);

final TagInfo winterMushroomInfo = TagInfo(
  imageUrl: 'assets/season/winter.png',
  tooltip: "Temporada d'hivern",
  label: 'Hivern',
  tag: Tag.winter,
);

final TagInfo edibleMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/edible.png',
  tooltip: 'Bon comestible',
  label: 'Comestible',
  tag: Tag.edible,
);

final TagInfo toxicMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/toxic.png',
  tooltip: 'Toxic, aluciogen o mortal',
  label: 'Tóxic',
  tag: Tag.toxic,
);

final TagInfo unknownMushroomInfo = TagInfo(
  imageUrl: 'assets/edibility/unknown.png',
  tooltip: 'Desconegut o sense informació',
  label: 'Desconegut',
  tag: Tag.unknown,
);

final List<TagInfo> allTagsInfo = [
  springMushroomInfo,
  summerMushroomInfo,
  autumnMushroomInfo,
  winterMushroomInfo,
  edibleMushroomInfo,
  toxicMushroomInfo,
  unknownMushroomInfo
];

TagInfo infoFromTag(Tag tag) {
  return allTagsInfo.firstWhere((item) {
    return item.tag == tag;
  }, orElse: () => unknownMushroomInfo);
}
