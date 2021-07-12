import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_tile.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';

import 'utils/index.dart';

Future testSearchScreen(WidgetTester tester) async {
  final testWidget = SearchScreen(filter: [], mushroomsList: []);
  await tester.pumpWidget(buildTestableWidget(testWidget));
  expect(find.text('No items'), findsOneWidget);
}

Future testFilterButton(WidgetTester tester) async {
  final id = SearchLabels.winter;
  final screen = Scaffold(
    body: FilterButton(id: id, isActive: true, text: 'some text'),
  );
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.text('some text'), findsOneWidget);
  expect(find.byType(FlatButton), findsOneWidget);
}

Future testSearchTile(WidgetTester tester) async {
  final item = MushroomInfo('name', 'scientific', [SearchLabels.winter]);
  final screen = Scaffold(body: SearchTile(item: item));
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.text(item.name), findsOneWidget);
  expect(find.text(item.nameScientific), findsOneWidget);
  expect(find.byType(DetailLabels), findsOneWidget);
}

void main() {
  testWidgets('Displays Search screen without any items', testSearchScreen);
  testWidgets('Displays a filter button', testFilterButton);
  testWidgets('Displays a search tile', testSearchTile);
}
