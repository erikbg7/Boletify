import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

// EVENTS
abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class AddNewFilter extends FilterEvent {
  final List<Tag> filter;
  const AddNewFilter(this.filter);
  @override
  List<Object> get props => [filter];
}

class AddToFilter extends FilterEvent {
  final Tag tag;
  const AddToFilter(this.tag);
  @override
  List<Object> get props => [tag];
}

class RemoveFromFilter extends FilterEvent {
  final Tag tag;
  const RemoveFromFilter(this.tag);
  @override
  List<Object> get props => [tag];
}

// STATES
abstract class FilterState {
  const FilterState();
}

class FilterResultState extends FilterState {
  final List<Tag> filter;
  final List<Mushroom> list;
  const FilterResultState(this.filter, this.list);
}

class FilterErrorState extends FilterState {
  final String errorMessage;
  const FilterErrorState(this.errorMessage);
}

// BLOC
class SearchFilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<Tag> filter;
  final List<Mushroom> initialList;
  static const filterError = "Error applying filter.";

  SearchFilterBloc(this.filter, this.initialList)
      : super(FilterResultState(filter, applyFilter(filter, initialList)));

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    try {
      if (event is AddToFilter) {
        filter.add(event.tag);
        yield FilterResultState(filter, applyFilter(filter, initialList));
      }
      if (event is RemoveFromFilter) {
        filter.removeWhere((label) => label == event.tag);
        yield FilterResultState(filter, applyFilter(filter, initialList));
      }
    } catch (error) {
      yield FilterErrorState(filterError);
    }
  }
}

applyFilter(List<Tag> filter, List<Mushroom> list) {
  return list
      .where((item) => filter.every((tag) => item.tags.contains(tag)))
      .toList();
}
