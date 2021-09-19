import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_view.dart';

import 'utils/index.dart';

class MockClassifierBloc extends MockBloc<ClassifierEvent, ClassifierState>
    implements ClassifierBloc {}

class FallbackState extends Fake implements ClassifierState {}

class FallbackEvent extends Fake implements ClassifierEvent {}

void main() {
  late ClassifierBloc mockClassifierBloc;

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
    'Sends ClassifyEvent when Camera button clicked',
    (WidgetTester tester) async {
      when(() => mockClassifierBloc.state).thenReturn(ClassifierMethodState());

      await tester.pumpWidget(buildMushroomBlocWidget());
      await tester.tap(find.text('Camara'));
      await tester.pumpAndSettle(Duration(seconds: 1));

      verify(() => mockClassifierBloc.add(any(that: isA<ClassifyEvent>())))
          .called(1);
    },
  );

  testWidgets(
    'Sends ClassifyEvent when Gallery button clicked',
        (WidgetTester tester) async {
      when(() => mockClassifierBloc.state).thenReturn(ClassifierMethodState());

      await tester.pumpWidget(buildMushroomBlocWidget());
      await tester.tap(find.text('Galeria'));
      await tester.pumpAndSettle(Duration(seconds: 1));

      verify(() => mockClassifierBloc.add(any(that: isA<ClassifyEvent>())))
          .called(1);
    },
  );
}
