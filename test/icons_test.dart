import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_card.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_image.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/detail/detail_screen.dart';

import 'utils/index.dart';

Future testDetailsScreen(WidgetTester tester) async {
  final screen = Scaffold(
    body: DetailScreen(
      image: new File(''),
      mushroom: getMushroomsListMock()[0],
    ),
  );
  await tester.pumpWidget(buildTestableWidget(screen));
  expect(find.byType(DetailCard), findsOneWidget);
  expect(find.byType(DetailLabels), findsOneWidget);
}

void main() {
  testWidgets('Displays a page for Mushroom Details', testDetailsScreen);
}
