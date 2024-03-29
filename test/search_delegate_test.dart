import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/screens/search/search_delegate.dart';
import 'package:futter_project_tfg/screens/search/search_results.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/index.dart';

class SearchDelegateTester extends StatelessWidget {
  final SearchDelegate delegate;

  const SearchDelegateTester({Key? key, required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: delegate.buildLeading(context),
        bottom: delegate.buildBottom(context),
      ),
      body: Column(children: [
        ...delegate.buildActions(context),
        Container(
          height: 100,
          child: delegate.buildResults(context),
        ),
        Container(
          height: 100,
          child: delegate.buildSuggestions(context),
        )
      ]),
    );
  }
}

void main() {
  testWidgets(
    'Displays Search Delegate screen without any items',
    (WidgetTester tester) async {
      SearchDelegate delegate =
          MushroomSearchDelegate(mushrooms: mushroomsListMock);
      final screen = Scaffold(body: SearchDelegateTester(delegate: delegate));

      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.byType(PreferredSize), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2));
      expect(find.byType(SearchResults), findsNWidgets(2));
    },
  );
}
