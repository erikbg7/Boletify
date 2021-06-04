import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/bloc/search/search_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

class FilterScreen extends StatelessWidget {
  final List<MushroomInfo> mushroomsList;
  final List<MushroomLabel> filter;

  const FilterScreen({Key key, this.filter, this.mushroomsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SearchFilterBloc(mushroomsList),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple,
          child: Center(child: Text("Filter")),
        ));
  }
}
