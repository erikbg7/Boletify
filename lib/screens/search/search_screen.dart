import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';

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
      child: BlocBuilder<SearchFilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterResultState) {
            return Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FilterButton(
                        text: 'Comestible',
                        id: SearchLabels.edible,
                        isActive: state.filter.contains(SearchLabels.edible),
                      ),
                      FilterButton(
                        text: 'Tóxic',
                        id: SearchLabels.toxic,
                        isActive: state.filter.contains(SearchLabels.toxic),
                      ),
                      FilterButton(
                        text: 'Primavera',
                        id: SearchLabels.spring,
                        isActive: state.filter.contains(SearchLabels.spring),
                      ),
                      FilterButton(
                        text: 'Estiu',
                        id: SearchLabels.summer,
                        isActive: state.filter.contains(SearchLabels.summer),
                      ),
                      FilterButton(
                        text: 'Tardor',
                        id: SearchLabels.autumn,
                        isActive: state.filter.contains(SearchLabels.autumn),
                      ),
                      FilterButton(
                        text: 'Hivern',
                        id: SearchLabels.winter,
                        isActive: state.filter.contains(SearchLabels.winter),
                      ),
                    ],
                  ),
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
                                return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(top: 5),
                                  width: double.infinity,
                                  color: Colors.black26,
                                  child: Column(
                                    children: [
                                      Text(
                                          '${item.name} -- ${item.nameScientific}'),
                                      DetailLabels(labels: item.labels),
                                      SizedBox(height: 5)

                                    ],
                                  ),
                                );

//                                return ListTile(
//                                  title: Text(
//                                      'Item ${mushroomsList[index].toConcatString()}'),
//                                );
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
