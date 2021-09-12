import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/search/components/search_view.dart';

class SearchScreen extends StatelessWidget {
  final List<Mushroom> mushroomsList;
  final List<Tag> filter;

  const SearchScreen(
      {Key? key, required this.filter, required this.mushroomsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchFilterBloc(filter, mushroomsList),
      child: SearchView(),
    );
  }
}
