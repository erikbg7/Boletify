import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

import 'utils/index.dart';

Future testDetailLabelsWidget(WidgetTester tester) async {
  final widget = Scaffold(body: DetailLabels(tags: [Tag.winter, Tag.summer]));
  await tester.pumpWidget(buildTestableWidget(widget));

  expect(find.byType(Row), findsOneWidget);
  expect(find.byType(CustomIcon), findsNWidgets(2));
}

void main() {
  testWidgets('DetailLabels widget', testDetailLabelsWidget);
}
