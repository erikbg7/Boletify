import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

// EVENTS
abstract class FilterEvent extends Equatable {
  const FilterEvent();
}


class AddNewFilter extends FilterEvent {
  final List<SearchLabels> labels;
  const AddNewFilter(this.labels);
  @override
  List<Object> get props => [labels];
}

class AddToFilter extends FilterEvent {
  final SearchLabels label;
  const AddToFilter(this.label);
  @override
  List<Object> get props => [label];
}

class RemoveFromFilter extends FilterEvent {
  final SearchLabels label;
  const RemoveFromFilter(this.label);
  @override
  List<Object> get props => [label];
}


// STATES
abstract class FilterState{
  const FilterState();
}

class FilterResultState extends FilterState {
  final List<SearchLabels> filter;
  const FilterResultState(this.filter);
}

// BLOC
class SearchFilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<SearchLabels> filter;

  SearchFilterBloc(this.filter)
      : super(FilterResultState(filter));

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is AddToFilter) {
      try {
        filter.add(event.label);
        yield FilterResultState(filter);
      } catch (error) {}
    }

    if (event is RemoveFromFilter) {
      try {
        filter.removeWhere((label) => label == event.label);
        yield FilterResultState(filter);
      } catch (error) {}
    }
  }
}
