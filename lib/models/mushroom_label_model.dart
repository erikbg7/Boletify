class MushroomLabel {
  final String imageUrl;
  final String tooltip;

  MushroomLabel({this.imageUrl, this.tooltip});
}

enum SearchLabels { spring, summer, autumn, winter, edible, toxic, unknown }

Map<SearchLabels, MushroomLabel> mushroomLabels = {
  SearchLabels.spring: MushroomLabel(
    imageUrl: 'assets/season/spring.png',
    tooltip: 'Temporada de primavera',
  ),
  SearchLabels.summer: MushroomLabel(
    imageUrl: 'assets/season/summer.png',
    tooltip: "Temporada d'estiu",
  ),
  SearchLabels.autumn: MushroomLabel(
    imageUrl: 'assets/season/autum.png',
    tooltip: "Temporada de tardor",
  ),
  SearchLabels.winter: MushroomLabel(
    imageUrl: 'assets/season/winter.png',
    tooltip: "Temporada d'hivern",
  ),
  SearchLabels.edible: MushroomLabel(
    imageUrl: 'assets/edibility/edible.png',
    tooltip: 'Bon comestible',
  ),
  SearchLabels.toxic: MushroomLabel(
    imageUrl: 'assets/edibility/toxic.png',
    tooltip: 'Toxic, aluciogen o mortal',
  ),
  SearchLabels.unknown: MushroomLabel(
    imageUrl: 'assets/edibility/unknown.png',
    tooltip: 'Desconegut o sense informació',
  )
};
