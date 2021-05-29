import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';

// EVENTS

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

// STATES

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
  final List<MushroomInfo> mushrooms;
  const MushroomsLoaded(this.mushrooms);
  @override
  List<Object> get props => [mushrooms];
}

class MushroomFound extends MushroomsState {
  final MushroomInfo mushroomInfo;
  const MushroomFound(this.mushroomInfo);
  @override
  List<Object> get props => [mushroomInfo];
}

// BLOC MANAGEMENT

class MushroomsBloc extends Bloc<MushroomsEvent, MushroomsState> {
  final MushroomsRepository _mushroomsRepository;

  MushroomsBloc({MushroomsRepository mushroomsRepository})
      : _mushroomsRepository = mushroomsRepository ?? MushroomsRepository(),
        super(MushroomsInitial());

//  @override
//  MushroomsState get initialState => MushroomsInitial();

  @override
  Stream<MushroomsState> mapEventToState(MushroomsEvent event) async* {
    // Emitting a state from the asynchronous generator
    yield MushroomsLoading();
    // Branching the executed logic by checking the event type
    if (event is GetAllMushrooms) {
      try {
        final activities = await _mushroomsRepository.getMushroomsList();
        yield MushroomsLoaded(activities);
      } catch (_) {
        yield MushroomsError("Couldn't fetch mushrooms. Is the device online?");
      }
    }
    if (event is FindMushroomById) {
      try {
        final List<MushroomInfo> activities =
            await _mushroomsRepository.getMushroomsList();

        final MushroomInfo result = activities
            .firstWhere((element) => element.name == event.mushroomId);

        print('bhjbdhjabhjdabjhabjdabdab ${result.toConcatString()}');

        yield MushroomFound(result);
      } catch (_) {
        yield MushroomsError("Couldn't fetch mushrooms. Is the device online?");
      }
    }
  }
}
