import 'package:flutter/material.dart';

enum Tag { spring, summer, autumn, winter, edible, toxic, unknown }

class TagInfo {
  final String imageUrl;
  final String label;
  final String tooltip;
  final List<Color> colors;

  TagInfo({
    required this.imageUrl,
    required this.label,
    required this.tooltip,
    required this.colors,
  });
}

tagsFromJson(List<dynamic> tagsJson) {
  List<Tag> tags = [];
  tagsJson.forEach((tag) => tags.add(tagFromString(tag)));
  return tags;
}

tagsToJson(List<Tag> tags) {
  List<dynamic> tagsJson = [];
  tags.forEach((tag) => tagsJson.add(tag.toString()));
  return tagsJson;
}

tagFromString(String tagString) {
  switch (tagString) {
    case 'Tag.edible':
      return Tag.edible;
    case 'Tag.toxic':
      return Tag.toxic;
    case 'Tag.spring':
      return Tag.spring;
    case 'Tag.summer':
      return Tag.summer;
    case 'Tag.autumn':
      return Tag.autumn;
    case 'Tag.winter':
      return Tag.winter;
    default:
      return Tag.unknown;
  }
}