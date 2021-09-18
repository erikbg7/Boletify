import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/settings_config.dart';
import 'package:futter_project_tfg/models/settings_model.dart';
import 'package:futter_project_tfg/screens/settings/credits/credits_screen.dart';
import 'package:futter_project_tfg/screens/settings/disclaimer/disclaimer_screen.dart';
import 'package:futter_project_tfg/screens/settings/privacy/privacy_screen.dart';
import 'package:futter_project_tfg/screens/settings/settings_screen.dart';
import 'package:futter_project_tfg/widgets/security_disclaimer.dart';

import 'utils/index.dart';

Future testSettingsScreen(WidgetTester tester) async {
  final screen = Scaffold(body: SettingsScreen());
  await tester.pumpWidget(buildTestableWidget(screen));
  Settings.values.forEach((setting) {
    expect(find.text(itemFromSettings(setting).text), findsOneWidget);
  });
}

Future testCreditsScreen(WidgetTester tester) async {
  final screen = Scaffold(body: CreditsScreen());
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.text('Credits'), findsOneWidget);
  expect(find.byType(Column), findsOneWidget);
  expect(find.text('wwww.github.com/erikbg7/Flutter-Project'), findsOneWidget);

  await tester.tap(find.byType(InkWell));
  await tester.pumpAndSettle();
}

Future testPrivacyScreen(WidgetTester tester) async {
  final screen = Scaffold(body: PrivacyScreen());
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.text('Privacitat'), findsOneWidget);
  expect(find.byType(Center), findsOneWidget);
  expect(find.byType(Text), findsWidgets);
}

Future testDisclaimerScreen(WidgetTester tester) async {
  final screen = Scaffold(body: DisclaimerScreen());
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.text('Responsabilitat'), findsOneWidget);
  expect(find.text(SecurityDisclaimer.message), findsOneWidget);
  expect(find.byType(Center), findsOneWidget);
  expect(find.byType(Text), findsWidgets);
}

void main() {
  testWidgets('Displays a page for Settings/Credits', testCreditsScreen);
  testWidgets('Displays a page for Settings/Privacy', testPrivacyScreen);
  testWidgets('Displays a page for Settings/Disclaimer', testDisclaimerScreen);
  testWidgets('Displays a list of settings', testSettingsScreen);
}
