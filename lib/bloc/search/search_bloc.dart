import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

// EVENTS
abstract class SearchFilterEvent extends Equatable {
  final List<MushroomLabel> filter;
  const SearchFilterEvent(this.filter);
}

// STATES
abstract class SearchFilterState extends Equatable {
  const SearchFilterState();
}

class SearchFilterInitial extends SearchFilterState {
  const SearchFilterInitial();
  @override
  List<Object> get props => [];
}

class SearchFilterResult extends SearchFilterState {
  const SearchFilterResult();
  @override
  List<Object> get props => [];
}

// BLOC
class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  final List<MushroomInfo> mushroomsList;

  SearchFilterBloc(this.mushroomsList) : super(SearchFilterInitial());

  @override
  Stream<SearchFilterState> mapEventToState(SearchFilterEvent event) {
    if (event is SearchFilterEvent) {
      try {
        mushroomsList.where((element) => false).toList();
      } catch (error) {}
    }

    // TODO: implement mapEventToState
//    throw UnimplementedError();
  }
}
