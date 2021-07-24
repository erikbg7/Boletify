import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_icons_list.dart';
import 'package:futter_project_tfg/screens/home/components/home_search_button.dart';
import 'package:futter_project_tfg/screens/home/components/home_title.dart';
import 'package:futter_project_tfg/screens/home/home_screen.dart';
import 'package:futter_project_tfg/widgets/home_security_disclaimer.dart';

import 'utils/index.dart';

Future testHomeScreen(WidgetTester tester) async {
  final screen = Scaffold(body: HomeScreen());
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.byType(HomeTitle), findsOneWidget);
  expect(find.byType(HomeSearchButton), findsOneWidget);
  expect(find.byType(HomeIconsList), findsOneWidget);
  expect(find.byType(HomeSecurityDisclaimer), findsOneWidget);

  Tag.values.forEach((tag) {
    if (tag != Tag.unknown) {
      expect(find.text(infoFromTag(tag).label), findsOneWidget);
    }
  });
}

void main() {
  testWidgets('Displays a page for Home', testHomeScreen);
}
