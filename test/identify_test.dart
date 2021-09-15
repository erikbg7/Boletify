import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_button.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_methods.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_results.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_view.dart';

import 'utils/index.dart';

class MockClassifierBloc extends MockBloc<ClassifierEvent, ClassifierState>
    implements ClassifierBloc {}

class FallbackState extends Fake implements ClassifierState {}

class FallbackEvent extends Fake implements ClassifierEvent {}

void main() {
  late MockClassifierBloc mockClassifierBloc;

  setUpAll(() {
    registerFallbackValue<ClassifierState>(FallbackState());
    registerFallbackValue<ClassifierEvent>(FallbackEvent());
  });

  setUp(() {
    mockClassifierBloc = MockClassifierBloc();
  });

  tearDown(() {
    mockClassifierBloc.close();
  });

  Widget buildMushroomBlocWidget() {
    return buildTestableWidget(
      Scaffold(
        body: BlocProvider<ClassifierBloc>.value(
          value: mockClassifierBloc,
          child: IdentifyView(),
        ),
      ),
    );
  }

  testWidgets(
    'Displays identification methods screen as initial state',
    (WidgetTester tester) async {
      when(() => mockClassifierBloc.state).thenReturn(ClassifierMethodState());
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(IdentifyMethods), findsWidgets);
    },
  );

  testWidgets(
    'Displays identification methods screen as result state',
    (WidgetTester tester) async {
      final out = ClassifierOutput(99.00, 'amanita', File('test'));
      when(() => mockClassifierBloc.state)
          .thenReturn(ClassifierResultState(out));
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(IdentifyResults), findsWidgets);
    },
  );

  testWidgets(
    'Displays loading screen as loading state',
    (WidgetTester tester) async {
      when(() => mockClassifierBloc.state).thenReturn(ClassifierStateLoading());
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
