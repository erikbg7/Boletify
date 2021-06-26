import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/screens/settings/credits/credits_screen.dart';
import 'package:futter_project_tfg/screens/settings/privacy/privacy_screen.dart';
import 'package:futter_project_tfg/screens/settings/settings_screen.dart';

import 'utils/index.dart';

void main() {
  testWidgets(
    'Displays a page for Settings/Credits',
    (WidgetTester tester) async {
      await tester
          .pumpWidget(buildTestableWidget(Scaffold(body: CreditsScreen())));
      expect(find.text('Credits'), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(
          find.text('wwww.github.com/erikbg7/Flutter-Project'), findsOneWidget);
    },
  );

  testWidgets(
    'Displays a page for Settings/Privacy',
    (WidgetTester tester) async {
      await tester
          .pumpWidget(buildTestableWidget(Scaffold(body: PrivacyScreen())));
      expect(find.text('Privacitat'), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
    },
  );

  testWidgets(
    'Displays a list of settings',
    (WidgetTester tester) async {
      await tester
          .pumpWidget(buildTestableWidget(Scaffold(body: SettingsScreen())));

      settingsMap.values.forEach((item) {
        expect(find.text(item.text), findsOneWidget);
      });
    },
  );
}
