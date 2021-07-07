import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

class FilterButton extends StatelessWidget {
  final SearchLabels id;
  final String text;
  final bool isActive;

  const FilterButton({Key key, this.id, this.isActive, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textColor = isActive ? Colors.white : Colors.white.withOpacity(0.5);
    return FlatButton(
      onPressed: () {
        final event = isActive ? RemoveFromFilter(id) : AddToFilter(id);
        BlocProvider.of<SearchFilterBloc>(context).add(event);
      },
      child: Column(
        children: [
          Text(text, style: TextStyle(color: textColor, decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
