import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

import 'utils/index.dart';

Future testDefaultTagsWidget(WidgetTester tester) async {
  final widget = Scaffold(body: DetailLabels(tags: [Tag.winter, Tag.summer]));
  await tester.pumpWidget(buildTestableWidget(widget));

  expect(find.byType(Row), findsOneWidget);
  expect(find.byType(CustomIcon), findsNWidgets(2));
}

Future testNoTagsWidget(WidgetTester tester) async {
  final widget = Scaffold(body: DetailLabels(tags: []));
  await tester.pumpWidget(buildTestableWidget(widget));

  expect(find.byType(CustomIcon), findsNWidgets(1));
}

void main() {
  testWidgets('DetailLabels widget', testDefaultTagsWidget);
  testWidgets('DetailLabels widget, without tags', testNoTagsWidget);
}
