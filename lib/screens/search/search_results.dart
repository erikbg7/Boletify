import 'package:flutter/material.dart';

import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'components/search_tile.dart';

class SearchResults extends StatelessWidget {
  final List<MushroomInfo> list;

  const SearchResults({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final MushroomInfo item = list.elementAt(index);
        return SearchTile(item: item);
      },
    );
  }
}