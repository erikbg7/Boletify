import 'package:flutter/material.dart';

enum SearchLabels { spring, summer, autumn, winter, edible, toxic, unknown }

class MushroomLabel {
  final String imageUrl;
  final String label;
  final String tooltip;
  final List<Color> colors;

  MushroomLabel({this.imageUrl, this.label, this.tooltip, this.colors});
}

tagsFromJson(List<dynamic> tagsJson) {
  List<SearchLabels> tags = [];
  tagsJson.forEach((tag) => tags.add(searchLabelFromString[tag]));
  return tags;
}

tagsToJson(List<SearchLabels> tags) {
  List<dynamic> tagsJson = [];
  tags.forEach((tag) => tagsJson.add(tag.toString()));
  return tagsJson;
}



Map<String, SearchLabels> searchLabelFromString = {
  'SearchLabels.edible': SearchLabels.edible,
  'SearchLabels.toxic': SearchLabels.toxic,
  'SearchLabels.spring': SearchLabels.spring,
  'SearchLabels.summer': SearchLabels.summer,
  'SearchLabels.autumn': SearchLabels.autumn,
  'SearchLabels.winter': SearchLabels.winter
};