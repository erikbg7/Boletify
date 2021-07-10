import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_icon.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

import 'utils/index.dart';

void main() {
  testWidgets(
    'Displays a Card widget with text and CustomIcon',
    (WidgetTester tester) async {
      final SearchLabels label = SearchLabels.winter;
      final MushroomLabel mushroom = mushroomLabels[label];
      await tester.pumpWidget(buildTestableWidget(
          Scaffold(body: HomeIcon(label: label))));

      expect(find.text(mushroom.tooltip), findsOneWidget);
      expect(find.byType(CustomIcon), findsOneWidget);
    },
  );
}
