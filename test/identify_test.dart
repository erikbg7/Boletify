import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';
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
      expect(find.byType(IdentifyTitle), findsOneWidget);
      expect(find.byType(IdentifyButton), findsNWidgets(2));
    },
  );

  testWidgets(
    'Displays identification methods screen as result state',
    (WidgetTester tester) async {
      final out = ClassifierOutput(99.00, 'amanita', File('test'));
      final mushroom = mushroomsListMock[0];
      when(() => mockClassifierBloc.state)
          .thenReturn(ClassifierResultState(out, mushroom));
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(IdentifyResults), findsWidgets);
      expect(find.byType(IdentifyTitle), findsOneWidget);
      expect(find.byType(IdentifyImage), findsOneWidget);
      expect(find.byType(DetailLabels), findsOneWidget);
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
    'Displays error screen when no result, methods or loading',
    (WidgetTester tester) async {
      when(() => mockClassifierBloc.state).thenReturn(ClassifierStateError(''));
      await tester.pumpWidget(buildMushroomBlocWidget());
      expect(find.byType(Container), findsOneWidget);
    },
  );
}
