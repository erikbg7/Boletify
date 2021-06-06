import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

class FilterButton extends StatelessWidget {
  final SearchLabels id;
  final bool isActive;

  const FilterButton({Key key, this.id, this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: isActive ? Colors.blueAccent : Colors.blueGrey,
      onPressed: () {
        final event = isActive ? RemoveFromFilter(id) : AddToFilter(id);
        BlocProvider.of<SearchFilterBloc>(context).add(event);
      },
      child: Text('$id'),
    );
  }
}
