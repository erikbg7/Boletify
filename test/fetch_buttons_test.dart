import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/buttons/fetch_buttons_screen.dart';

import 'utils/index.dart';

Future testFetchButtonsScreen(WidgetTester tester) async {
  final screen = Scaffold(body: FetchButtons());
  await tester.pumpWidget(buildTestableWidget(screen));

  expect(find.byType(TextButton), findsNWidgets(2));
  expect(find.text('FindByName'), findsOneWidget);
  expect(find.text('GetAllMuhsrooms'), findsOneWidget);
}

void main() {
  testWidgets('HomeIcon widget', testFetchButtonsScreen);
}
