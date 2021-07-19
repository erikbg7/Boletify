import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_button.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_methods.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_results.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_view.dart';

import 'utils/index.dart';

class MockMushroomsBloc extends MockBloc<MushroomsEvent, MushroomsState>
    implements MushroomsBloc {}

class FallbackState extends Fake implements MushroomsState {}

class FallbackEvent extends Fake implements MushroomsEvent {}

void main() {
  late MockMushroomsBloc mockMushroomsBloc;

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

  Widget buildMushroomBlocWidget() {
    return buildTestableWidget(
      Scaffold(
        body: BlocProvider<MushroomsBloc>.value(
          value: mockMushroomsBloc,
          child: IdentifyView(),
        ),
      ),
    );
  }

  testWidgets(
    'Displays identification methods screen as initial state',
    (WidgetTester tester) async {
      when(() => mockMushroomsBloc.state).thenReturn(MushroomsInitial());
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(IdentifyMethods), findsWidgets);
    },
  );

  testWidgets(
    'Displays identification methods screen as result state',
    (WidgetTester tester) async {
      final out = ClassifierOutput(99.00, 'amanita', File('test'));
      when(() => mockMushroomsBloc.state).thenReturn(MushroomClassified(out));
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(IdentifyResults), findsWidgets);
    },
  );

  testWidgets(
    'Displays loading screen as loading state',
    (WidgetTester tester) async {
      when(() => mockMushroomsBloc.state).thenReturn(MushroomsLoading());
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(CircularProgressIndicator), findsWidgets);
    },
  );

  testWidgets(
    'Displays loading screen as loading state',
    (WidgetTester tester) async {
      final screen = Scaffold(body: IdentifyMethods());
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.byType(IdentifyTitle), findsOneWidget);
      expect(find.byType(IdentifyButton), findsNWidgets(2));
    },
  );
}
