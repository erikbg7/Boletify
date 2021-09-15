import 'package:futter_project_tfg/models/tag_model.dart';

final TagInfo springTagInfo = TagInfo(
  imageUrl: 'assets/season/spring.png',
  description: 'Temporada de primavera',
  label: 'Primavera',
  tag: Tag.spring,
);

final TagInfo summerTagInfo = TagInfo(
  imageUrl: 'assets/season/summer.png',
  description: "Temporada d'estiu",
  label: 'Estiu',
  tag: Tag.summer,
);

final TagInfo autumnTagInfo = TagInfo(
  imageUrl: 'assets/season/autum.png',
  description: "Temporada de tardor",
  label: 'Tardor',
  tag: Tag.autumn,
);

final TagInfo winterTagInfo = TagInfo(
  imageUrl: 'assets/season/winter.png',
  description: "Temporada d'hivern",
  label: 'Hivern',
  tag: Tag.winter,
);

final TagInfo edibleTagInfo = TagInfo(
  imageUrl: 'assets/edibility/edible.png',
  description: 'Bon comestible',
  label: 'Comestible',
  tag: Tag.edible,
);

final TagInfo toxicTagInfo = TagInfo(
  imageUrl: 'assets/edibility/toxic.png',
  description: 'Toxic, aluciogen o mortal',
  label: 'Tóxic',
  tag: Tag.toxic,
);

final TagInfo unknownTagInfo = TagInfo(
  imageUrl: 'assets/edibility/unknown.png',
  description: 'Desconegut o sense informació',
  label: 'Desconegut',
  tag: Tag.unknown,
);

final List<TagInfo> allTagsInfo = [
  springTagInfo,
  summerTagInfo,
  autumnTagInfo,
  winterTagInfo,
  edibleTagInfo,
  toxicTagInfo,
  unknownTagInfo
];

TagInfo infoFromTag(Tag tag) {
  return allTagsInfo.firstWhere((item) {
    return item.tag == tag;
  }, orElse: () => unknownTagInfo);
}
