import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

class FilterButton extends StatelessWidget {
  final SearchLabels id;
  final String text;
  final bool isActive;

  const FilterButton({Key key, this.id, this.isActive, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return MaterialButton(
//      color: Colors.blue,
//      shape: CircleBorder(),
//      onPressed: () {},
//      child: Padding(
//        padding: const EdgeInsets.all(100),
//        child: Text(
//          'A circle button',
//          style: TextStyle(color: Colors.white, fontSize: 24),
//        ),
//      ),
//    );

    return FlatButton(
      color: isActive ? Colors.blueAccent : Colors.blueGrey,
      onPressed: () {
        final event = isActive ? RemoveFromFilter(id) : AddToFilter(id);
        BlocProvider.of<SearchFilterBloc>(context).add(event);
      },
      child: Text(text),
    );
  }
}
