import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';

// ----------------- EVENTS ----------------- //
abstract class MushroomsEvent extends Equatable {
  const MushroomsEvent();
}

class GetAllMushrooms extends MushroomsEvent {
  const GetAllMushrooms();
  @override
  List<Object> get props => [];
}

class FindMushroomById extends MushroomsEvent {
  final String mushroomId;
  const FindMushroomById(this.mushroomId);
  @override
  List<Object> get props => [mushroomId];
}

// ----------------- STATES ----------------- //
abstract class MushroomsState extends Equatable {
  const MushroomsState();
}

class MushroomsInitial extends MushroomsState {
  const MushroomsInitial();
  @override
  List<Object> get props => [];
}

class MushroomsLoading extends MushroomsState {
  const MushroomsLoading();
  @override
  List<Object> get props => [];
}

class MushroomsError extends MushroomsState {
  final String errorMessage;
  const MushroomsError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class MushroomsLoaded extends MushroomsState {
  final List<Mushroom> mushroomList;
  const MushroomsLoaded(this.mushroomList);
  @override
  List<Object> get props => [mushroomList];
}

class MushroomFound extends MushroomsState {
  final Mushroom mushroom;
  const MushroomFound(this.mushroom);
  @override
  List<Object> get props => [mushroom];
}

// ------------------ BLOC ------------------ //
class MushroomsBloc extends Bloc<MushroomsEvent, MushroomsState> {
  final MushroomsRepository _repository;
  static const fetchingError =
      "Couldn't fetch mushrooms. Is the device online?";

  MushroomsBloc({MushroomsRepository? mushroomsRepository})
      : _repository = mushroomsRepository ?? MushroomsRepository(),
        super(MushroomsInitial());

  @override
  Stream<MushroomsState> mapEventToState(MushroomsEvent event) async* {
    try {
      yield MushroomsLoading();
      if (event is GetAllMushrooms) {
        final mushroomList = await _repository.getMushroomsList();
        yield MushroomsLoaded(mushroomList);
      }
      if (event is FindMushroomById) {
        final mushroomList = await _repository.getMushroomsList();
        final Mushroom result = mushroomList.firstWhere(
            (element) => element.name == event.mushroomId,
            orElse: () => Mushroom.buildEmpty());

        yield MushroomFound(result);
      }
    } catch (_) {
      yield MushroomsError(fetchingError);
    }
  }
}
