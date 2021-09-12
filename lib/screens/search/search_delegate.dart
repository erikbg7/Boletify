import 'package:flutter/material.dart';

import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/search/search_results.dart';

class MushroomSearchDelegate extends SearchDelegate<Mushroom> {
  final List<Mushroom> mushrooms;
  late Mushroom result = Mushroom.buildEmpty();

  MushroomSearchDelegate({required this.mushrooms});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black45,
    );
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, result),
    );
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return PreferredSize(
        child: const SizedBox(),
        preferredSize: Size.fromHeight(10));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = mushrooms.where((mushroom) {
      return mushroom.name.toLowerCase().contains(query.toLowerCase());
    });
    return SearchResults(list: suggestions.toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = mushrooms.where((mushroom) {
      return mushroom.name.toLowerCase().contains(query.toLowerCase());
    });
    return SearchResults(list: suggestions.toList());
  }
}
