import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/buttons/fetch_buttons_screen.dart';

import 'utils/index.dart';

class MockMushroomsBloc extends MockBloc<MushroomsEvent, MushroomsState>
    implements MushroomsBloc {}

class FallbackState extends Fake implements MushroomsState {}

class FallbackEvent extends Fake implements MushroomsEvent {}


void main() {
  late MushroomsBloc mockMushroomsBloc;

  setUpAll(() {
    registerFallbackValue<MushroomsState>(FallbackState());
    registerFallbackValue<MushroomsEvent>(FallbackEvent());
  });

  setUp(() {
    mockMushroomsBloc = MockMushroomsBloc();
  });

  tearDown(() {
    mockMushroomsBloc.close();
  });

  testWidgets(
    'Displays Search screen without any items',
    (WidgetTester tester) async {
      final testWidget = BlocProvider.value(
        value: mockMushroomsBloc,
        child: FetchButtons(),
      );

      when(() => mockMushroomsBloc.state).thenReturn(MushroomsInitial());

      await tester.pumpWidget(buildTestableWidget(testWidget));
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(TextButton), findsNWidgets(2));
      expect(find.text('FindByName'), findsOneWidget);
      expect(find.text('GetAllMuhsrooms'), findsOneWidget);

      await tester.press(find.text('FindByName'));
      await tester.pump(Duration(seconds: 1));

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(TextButton), findsNWidgets(2));
      expect(find.text('FindByName'), findsOneWidget);
      expect(find.text('GetAllMuhsrooms'), findsOneWidget);

      await tester.press(find.text('GetAllMuhsrooms'));
      await tester.pump(Duration(seconds: 1));

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(TextButton), findsNWidgets(2));
      expect(find.text('FindByName'), findsOneWidget);
      expect(find.text('GetAllMuhsrooms'), findsOneWidget);
    },
  );
}
