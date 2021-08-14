import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/widgets/black_white_filter.dart';

class FilterButton extends StatelessWidget {
  final Tag id;
  final String imageUrl;
  final bool isActive;

  const FilterButton({
    Key? key,
    required this.id,
    required this.isActive,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = isActive ? RemoveFromFilter(id) : AddToFilter(id);

    return TextButton(
        onPressed: () => BlocProvider.of<SearchFilterBloc>(context).add(event),
        child: BlackWhiteFilter(
          isFilterActive: isActive,
          child: Image.asset(imageUrl),
        ));
  }
}
