import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_button.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_methods.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';

import 'utils/index.dart';

Future testIdentifyMethods(WidgetTester tester) async {
  final screen = Scaffold(body: IdentifyMethods());
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.byType(IdentifyTitle), findsOneWidget);
  expect(find.byType(IdentifyButton), findsNWidgets(2));
}

void main() {
  testWidgets('Displays two identification methods', testIdentifyMethods);
}
