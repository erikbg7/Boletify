import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_card.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

void main() {
  testWidgets(
    'Displays a Card widget with text and CustomIcon',
    (WidgetTester tester) async {
      final SearchLabels label = SearchLabels.winter;
      final MushroomLabel mushroom = mushroomLabels[label];
      await tester.pumpWidget(buildTestableWidget(HomeCard(label: label)));

      expect(find.text(mushroom.tooltip), findsOneWidget);
      expect(find.byType(CustomIcon), findsOneWidget);
    },
  );
}
