import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_methods.dart';
import 'utils/index.dart';

Future testIdentificationMethods(WidgetTester tester) async {
  final screen = Scaffold(body: IdentifyMethods());
  await tester.pumpWidget(buildTestableWidget(screen));

  expect(find.text('Camara'), findsOneWidget);
  expect(find.text('Galeria'), findsOneWidget);
}

void main() {
  testWidgets('Displays Gallery and Camera buttons', testIdentificationMethods);
}