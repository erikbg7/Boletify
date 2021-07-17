import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/search/components/search_view.dart';

class SearchScreen extends StatelessWidget {
  final List<MushroomInfo> mushroomsList;
  final List<SearchLabels> filter;

  const SearchScreen(
      {Key key, @required this.filter, @required this.mushroomsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchFilterBloc(filter),
      child: SearchView(filter: filter, mushroomsList: mushroomsList),
    );
  }
}
