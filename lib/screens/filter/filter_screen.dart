import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/filter/components/filter_button.dart';

class FilterScreen extends StatelessWidget {
  final List<MushroomInfo> mushroomsList;
  final List<SearchLabels> filter;

  const FilterScreen(
      {Key key, @required this.filter, @required this.mushroomsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchFilterBloc(filter),
      child: BlocBuilder<SearchFilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterResultState) {
            return Column(
              children: [
                FilterButton(
                  id: SearchLabels.toxic,
                  isActive: state.filter.contains(SearchLabels.toxic),
                ),
                FilterButton(
                  id: SearchLabels.summer,
                  isActive: state.filter.contains(SearchLabels.summer),
                ),
                FilterButton(
                  id: SearchLabels.autumn,
                  isActive: state.filter.contains(SearchLabels.autumn),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.deepPurple,
                    child: mushroomsList.length > 0
                        ? ListView.builder(
                            itemCount: mushroomsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final MushroomInfo item = mushroomsList[index];
                              if (state.filter.every(
                                  (label) => item.labels.contains(label))) {
                                return ListTile(
                                  title: Text(
                                      'Item ${mushroomsList[index].toConcatString()}'),
                                );
                              }
                              return SizedBox();
                            },
                          )
                        : const Center(child: Text('No items')),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('No items'));
        },
      ),
    );
  }
}