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
      padding: EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildFilters(list, activeFilter),
      ),
    );
  }
}

List<Widget> buildFilters(List<TagInfo> list, List<Tag> activeFilter) {
  return list.map((item) {
    final isActive = activeFilter.contains(item.tag);
    return FilterButton(
      tag: item.tag,
      isActive: isActive,
      imageUrl: item.imageUrl,
    );
  }).toList();
}

bool isNotUnknownTag(TagInfo tagInfo) => tagInfo.tag != Tag.unknown;
