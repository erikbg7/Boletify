import 'package:flutter/material.dart';

enum SearchLabels { spring, summer, autumn, winter, edible, toxic, unknown }

class MushroomLabel {
  final String imageUrl;
  final String tooltip;
  final List<Color> colors;

  MushroomLabel({this.imageUrl, this.tooltip, this.colors});
}
