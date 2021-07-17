import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
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



class MockMushroomsBloc extends MockBloc<MushroomsState>
    implements MushroomsBloc {}

void main() {
  MushroomsBloc mockMushroomsBloc;

  setUp(() {
    mockMushroomsBloc = MockMushroomsBloc();
  });
  tearDown(() {
    mockMushroomsBloc?.close();
  });

  testWidgets(
    'Displays identification methods screen as initial state',
    (WidgetTester tester) async {
      final child = IdentifyView();
      final widget = BlocProvider.value(value: mockMushroomsBloc, child: child);

      when(mockMushroomsBloc.state).thenReturn(MushroomsInitial());
      await tester.pumpWidget(buildTestableWidget(Scaffold(body: widget)));
      expect(find.byType(IdentifyMethods), findsWidgets);
    },
  );

  testWidgets(
    'Displays identification methods screen as result state',
    (WidgetTester tester) async {
      final output = ClassifierOutput(99.00, 'amanita', File('test'));
      final child = IdentifyView();
      final widget = BlocProvider.value(value: mockMushroomsBloc, child: child);

      when(mockMushroomsBloc.state).thenReturn(MushroomClassified(output));
      await tester.pumpWidget(buildTestableWidget(Scaffold(body: widget)));
      expect(find.byType(IdentifyResults), findsWidgets);
    },
  );

  testWidgets(
    'Displays loading screen as loading state',
    (WidgetTester tester) async {
      final child = IdentifyView();
      final widget = BlocProvider.value(value: mockMushroomsBloc, child: child);

      when(mockMushroomsBloc.state).thenReturn(MushroomsLoading());
      await tester.pumpWidget(buildTestableWidget(Scaffold(body: widget)));
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
