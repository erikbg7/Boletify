import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../utils/firebase_mocks.dart';

class MockMushroomsRepository extends Mock implements MushroomsRepository {}

void main() {
  setupFirebaseAuthMocks();
  late MockMushroomsRepository mockMushroomsRepository;

  setUp(() async {
    await Firebase.initializeApp();
    mockMushroomsRepository = MockMushroomsRepository();
  });

  group('getAllMushrooms', () {
    final List<Mushroom> response = [mushroomsListMock[0]];

    blocTest(
      'emits [MushroomsLoading, MushroomsLoaded] when successful getAllMushrooms event',
      build: () {
        when(() => mockMushroomsRepository.getMushroomsList())
            .thenAnswer((_) async => response);
        return MushroomsBloc(mushroomsRepository: mockMushroomsRepository);
      },
      act: (MushroomsBloc bloc) => bloc.add(GetAllMushrooms()),
      expect: () => [MushroomsLoading(), MushroomsLoaded(response)],
    );

    blocTest(
      'emits [MushroomsLoading, MushroomsError] when failed getAllMushrooms event',
      build: () {
        when(() => mockMushroomsRepository.getMushroomsList())
            .thenThrow(Error());
        return MushroomsBloc(mushroomsRepository: mockMushroomsRepository);
      },
      act: (MushroomsBloc bloc) => bloc.add(GetAllMushrooms()),
      expect: () =>
          [MushroomsLoading(), MushroomsError(MushroomsBloc.fetchingError)],
    );
  });
  group('findMushroomById', () {
    final List<Mushroom> response = [
      mushroomsListMock[0],
      mushroomsListMock[1]
    ];
    final Mushroom foundMushroom = mushroomsListMock[1];

    blocTest(
      'emits [MushroomsLoading, MushroomFound] when successful FindMushroomById event',
      build: () {
        when(() => mockMushroomsRepository.getMushroomsList())
            .thenAnswer((_) async => response);
        return MushroomsBloc(mushroomsRepository: mockMushroomsRepository);
      },
      act: (MushroomsBloc bloc) =>
          bloc.add(FindMushroomById(foundMushroom.name)),
      expect: () => [MushroomsLoading(), MushroomFound(foundMushroom)],
    );

    blocTest(
      'emits [MushroomsLoading, MushroomsError] when failed FindMushroomById event',
      build: () {
        when(() => mockMushroomsRepository.getMushroomsList())
            .thenThrow(Error());
        return MushroomsBloc(mushroomsRepository: mockMushroomsRepository);
      },
      act: (MushroomsBloc bloc) =>
          bloc.add(FindMushroomById(foundMushroom.name)),
      expect: () =>
          [MushroomsLoading(), MushroomsError(MushroomsBloc.fetchingError)],
    );
  });
}
