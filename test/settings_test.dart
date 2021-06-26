import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/screens/settings/settings_screen.dart';

import 'utils/index.dart';

void main() {
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
