import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/tags_config.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class DetailLabels extends StatelessWidget {
  final List<Tag> tags;
  final MainAxisAlignment alignment;
  final bool small;

  const DetailLabels(
      {Key? key,
      required this.tags,
      this.small = false,
      this.alignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      final unknownLabel = infoFromTag(Tag.unknown);
      return CustomIcon(
        image: unknownLabel.imageUrl,
        tooltip: unknownLabel.tooltip,
        size: 50,
      );
    }

    List<Widget> tagsList = [];

    tags.forEach((tag) {
        TagInfo tagInfo = infoFromTag(tag);
        tagsList.add(CustomIcon(
          image: tagInfo.imageUrl,
          tooltip: tagInfo.tooltip,
          size: small ? 15 : 50,
        ));
    });

    return Row(
      children: tagsList,
      mainAxisAlignment: alignment,
    );
  }
}