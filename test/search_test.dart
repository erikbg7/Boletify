import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';

import 'utils/index.dart';

void main() {
  testWidgets(
    'Displays Search screen without any items',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(SearchScreen(filter: [], mushroomsList: [])));
      expect(find.text('No items'), findsOneWidget);
    },
  );
}
