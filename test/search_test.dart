import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';

import 'utils/index.dart';

Future testSearchScreen(WidgetTester tester) async {
  final testWidget = SearchScreen(filter: [], mushroomsList: []);
  await tester.pumpWidget(buildTestableWidget(testWidget));
  expect(find.text('No items'), findsOneWidget);
}

void main() {
  testWidgets('Displays Search screen without any items', testSearchScreen);
}
