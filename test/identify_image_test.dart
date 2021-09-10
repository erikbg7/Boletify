import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/detail/detail_screen.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';

import 'utils/index.dart';

void main() {
  testWidgets(
    'Displays IdentifyImage widget',
    (WidgetTester tester) async {
      final screen = Scaffold(body: IdentifyImage(image: File('imageUrl')));
      await tester.pumpWidget(buildTestableWidget(screen));

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(DetailScreen), findsOneWidget);
    },
  );
}
