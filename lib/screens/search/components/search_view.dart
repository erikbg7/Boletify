import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_tile.dart';

class SearchView extends StatelessWidget {
  final List<MushroomInfo> mushroomsList;
  final List<Tag> filter;

  const SearchView(
      {Key? key, required this.filter, required this.mushroomsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterResultState) {
          return Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilterButton(
                      text: 'Comestible',
                      id: Tag.edible,
                      isActive: state.filter.contains(Tag.edible),
                    ),
                    FilterButton(
                      text: 'Tóxic',
                      id: Tag.toxic,
                      isActive: state.filter.contains(Tag.toxic),
                    ),
                    FilterButton(
                      text: 'Primavera',
                      id: Tag.spring,
                      isActive: state.filter.contains(Tag.spring),
                    ),
                    FilterButton(
                      text: 'Estiu',
                      id: Tag.summer,
                      isActive: state.filter.contains(Tag.summer),
                    ),
                    FilterButton(
                      text: 'Tardor',
                      id: Tag.autumn,
                      isActive: state.filter.contains(Tag.autumn),
                    ),
                    FilterButton(
                      text: 'Hivern',
                      id: Tag.winter,
                      isActive: state.filter.contains(Tag.winter),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.black45,
                  child: mushroomsList.length > 0
                      ? ListView.builder(
                          itemCount: mushroomsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final MushroomInfo item = mushroomsList[index];
                            if (state.filter
                                .every((label) => item.tags.contains(label))) {
                              return SearchTile(item: item);
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
        return Container(child: Center(child: Text('No items')));
      },
    );
  }
}
