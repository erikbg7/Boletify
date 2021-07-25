import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_results.dart';
import 'package:futter_project_tfg/screens/identify/results/confidence.dart';

import 'utils/index.dart';

void main() {
  testWidgets(
    'Displays HighConfidence screen when confidence is high',
    (WidgetTester tester) async {
      final result = ClassifierOutput(0.96, 'Amanita', File('image'));
      final screen = Scaffold(body: IdentifyResults(result: result));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.byType(HighConfidence), findsOneWidget);
    },
  );
  testWidgets(
    'Displays MediumConfidence screen when confidence is not high or low',
        (WidgetTester tester) async {
      final result = ClassifierOutput(0.70, 'Amanita', File('image'));
      final screen = Scaffold(body: IdentifyResults(result: result));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.byType(MediumConfidence), findsOneWidget);
    },
  );
  testWidgets(
    'Displays LowConfidence screen when confidence is low',
        (WidgetTester tester) async {
      final result = ClassifierOutput(0.35, 'Amanita', File('image'));
      final screen = Scaffold(body: IdentifyResults(result: result));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.byType(LowConfidence), findsOneWidget);
    },
  );
}
