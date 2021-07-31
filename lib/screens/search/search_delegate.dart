//import 'package:flutter/material.dart';
//import 'package:futter_project_tfg/models/mushroom_info_model.dart';
//import 'package:futter_project_tfg/screens/search/search_screen.dart';
//
//class NameSearch extends SearchDelegate<MushroomInfo> {
//  final List<MushroomInfo> mushrooms;
//  MushroomInfo result;
//
//  NameSearch(this.mushrooms);
//
//
//  @override
//  ThemeData appBarTheme(BuildContext context) {
//    assert(context != null);
//    final ThemeData theme = Theme.of(context);
//    assert(theme != null);
//    return theme;
//  }
//
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    return [
//      IconButton(
//        icon: Icon(Icons.clear),
//        onPressed: () {
//          query = '';
//        },
//      )
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    return IconButton(
//      icon: Icon(Icons.arrow_back),
//      onPressed: () {
//        close(context, result);
//      },
//    );
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    final suggestions = mushrooms.where((mushroom) {
//      return mushroom.name.toLowerCase().contains(query.toLowerCase());
//    });
//
//    return ListView.builder(
//      itemCount: suggestions.length,
//      itemBuilder: (BuildContext context, int index) {
//        final item = suggestions.elementAt(index);
//        return SearchResult(item: item);
////        return ListTile(
////          title: Text(
////            suggestions.elementAt(index).name,
////          ),
////          onTap: () {
////            result = suggestions.elementAt(index);
////            close(context, result);
////          },
////        );
//      },
//    );
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    final suggestions = mushrooms.where((mushroom) {
//      return mushroom.name.toLowerCase().contains(query.toLowerCase());
//    });
//
//    return ListView.builder(
//      itemCount: suggestions.length,
//      itemBuilder: (BuildContext context, int index) {
//        final item = suggestions.elementAt(index);
//        return SearchResult(item: item);
////        return ListTile(
////          title: Text(
////            suggestions.elementAt(index).name,
////          ),
////          onTap: () {
////            query = suggestions.elementAt(index).name;
////          },
////        );
//      },
//    );
//  }
//}