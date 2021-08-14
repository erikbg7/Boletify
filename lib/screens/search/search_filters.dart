import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/tags_config.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';

class SearchFilters extends StatelessWidget {
  final List<Tag> activeFilter;
  static List<TagInfo> list = allTagsInfo.where(isNotUnknownTag).toList();

  SearchFilters({Key? key, required this.activeFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
        controller: ScrollController(initialScrollOffset: 40),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) =>
            buttonsBuilder(list, activeFilter, index),
      ),
    );
  }
}

FilterButton buttonsBuilder(
    List<TagInfo> list, List<Tag> activeFilter, int index) {
  final TagInfo info = list[index];
  final isActive = activeFilter.contains(info.tag);
  return FilterButton(
      id: info.tag, isActive: isActive, imageUrl: info.imageUrl);
}

bool isNotUnknownTag(TagInfo tagInfo) => tagInfo.tag != Tag.unknown;
