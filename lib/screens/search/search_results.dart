import 'package:flutter/material.dart';

import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'components/search_tile.dart';

class SearchResults extends StatelessWidget {
  final List<Mushroom> list;

  const SearchResults({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 5),
        itemBuilder: (BuildContext context, int index) {
          final Mushroom item = list.elementAt(index);
          return SearchTile(item: item);
        },
      ),
    );
  }
}
