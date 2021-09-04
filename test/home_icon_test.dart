import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/tags_config.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_icon.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

import 'utils/index.dart';

Future testHomeIconWidget(WidgetTester tester) async {
  final widget = Scaffold(body: HomeIcon(tag: Tag.winter));
  await tester.pumpWidget(buildTestableWidget(widget));
  TagInfo tagInfo = infoFromTag(Tag.winter);

  expect(find.byType(InkWell), findsOneWidget);
  expect(find.byType(CustomIcon), findsOneWidget);
  expect(find.text(tagInfo.label), findsOneWidget);
}

void main() {
  testWidgets('HomeIcon widget', testHomeIconWidget);
}
