//import 'package:bloc_test/bloc_test.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';
//import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
//import 'package:futter_project_tfg/models/mushroom_model.dart';
//import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tflite/tflite.dart';

class MockTflite extends Mock implements Tflite {}

void main() {
//  late MockTflite mockTflite;
//
//  setUp(() async {
//    mockTflite = MockTflite();
//  });
//
//  group('getAllMushrooms', () {
//    blocTest(
//      'emits [MushroomsLoading, MushroomsLoaded] when successful getAllMushrooms event',
//      build: () {
//        return ClassifierBloc();
//      },
//      act: (ClassifierBloc bloc) => bloc.add(InitializeClassifierEvent()),
//      wait: Duration(seconds: 2),
//      expect: () => [ClassifierMethodState()],
//    );
    ////////////////

//    blocTest(
//      'emits [MushroomsLoading, MushroomsError] when failed getAllMushrooms event',
//      build: () {
//        when(() => mockMushroomsRepository.getMushroomsList())
//            .thenThrow(Error());
//        return MushroomsBloc(mushroomsRepository: mockMushroomsRepository);
//      },
//      act: (MushroomsBloc bloc) => bloc.add(GetAllMushrooms()),
//      expect: () =>
//          [MushroomsLoading(), MushroomsError(MushroomsBloc.fetchingError)],
//    );



/////////////
//  });
}
