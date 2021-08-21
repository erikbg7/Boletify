import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/widgets/black_white_filter.dart';

class FilterButton extends StatelessWidget {
  final Tag tag;
  final String imageUrl;
  final bool isActive;

  const FilterButton({
    Key? key,
    required this.tag,
    required this.isActive,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = isActive ? RemoveFromFilter(tag) : AddToFilter(tag);

    return Material(
      child: InkWell(
        onTap: () => BlocProvider.of<SearchFilterBloc>(context).add(event),
        child: Container(
          color: Color(0xFF112523),
          child: BlackWhiteFilter(
            isFilterActive: isActive,
            child: Image.asset(imageUrl),
          ),
        ),
      ),
    );
  }
}
