import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

// EVENTS

abstract class MushroomsEvent extends Equatable {
  const MushroomsEvent();
}

class ClassifyMushroom extends MushroomsEvent {
  final ImageSource source;
  const ClassifyMushroom(this.source);
  @override
  List<Object> get props => [];
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

class MushroomClassified extends MushroomsState {
  final ClassifierOutput output;
  const MushroomClassified(this.output);
  @override
  List<Object> get props => [output];
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

// BLOC MANAGEMENT

class MushroomsBloc extends Bloc<MushroomsEvent, MushroomsState> {
  final MushroomsRepository _mushroomsRepository;

  MushroomsBloc({MushroomsRepository? mushroomsRepository})
      : _mushroomsRepository = mushroomsRepository ?? MushroomsRepository(),
        super(MushroomsInitial());

//  @override
//  MushroomsState get initialState => MushroomsInitial();

  @override
  Stream<MushroomsState> mapEventToState(MushroomsEvent event) async* {
    // Emitting a state from the asynchronous generator
    // yield MushroomsLoading();
    // Branching the executed logic by checking the event type
    if (event is ClassifyMushroom) {
      try {
        final XFile? pickedImage =
            await ImagePicker().pickImage(source: event.source);
        final File image = File(pickedImage!.path);
        yield MushroomsLoading();
        final tfResult = await Tflite.runModelOnImage(
          path: image.path,
          numResults: 2,
          threshold: 0.5,
          imageMean: 127.5,
          imageStd: 127.5,
        );
        final output = new ClassifierOutput.fromTFLite(tfResult!, image);
        // We delay the response a few seconds to improve UX
        await Future.delayed(Duration(milliseconds: 500));
        yield MushroomClassified(output);
      } catch (error) {
        //TODO: handle error correctly
        print('------- ERROR: $error');
      }
    }
    if (event is GetAllMushrooms) {
      try {
        final mushroomList = await _mushroomsRepository.getMushroomsList();
        yield MushroomsLoaded(mushroomList);
      } catch (_) {
        yield MushroomsError("Couldn't fetch mushrooms. Is the device online?");
      }
    }
    if (event is FindMushroomById) {
      try {
        final List<Mushroom> mushroomList =
            await _mushroomsRepository.getMushroomsList();

        final Mushroom result = mushroomList.firstWhere(
            (element) => element.name == event.mushroomId,
            orElse: () => Mushroom.buildEmpty());

        yield MushroomFound(result);
      } catch (_) {
        yield MushroomsError("Couldn't fetch mushrooms. Is the device online?");
      }
    }
  }
}
