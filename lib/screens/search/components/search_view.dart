import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/screens/search/search_filters.dart';
import 'package:futter_project_tfg/screens/search/search_results.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterResultState) {
          return Column(
            children: [
              SearchFilters(activeFilter: state.filter),
              Container(height: 5,width: double.infinity, color: Colors.black45),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black45,
                  child: state.list.length > 0
                      ? SearchResults(list: state.list)
                      : const Center(child: Text('No items')),
                ),
              ),
            ],
          );
        }
        return Container(child: Center(child: Text('No items')));
      },
    );
  }
}
