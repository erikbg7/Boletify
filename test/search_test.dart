import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_tile.dart';
import 'package:futter_project_tfg/screens/search/components/search_view.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';

import 'utils/index.dart';

class MockFilterBloc extends MockBloc<FilterState> implements SearchFilterBloc {
}

void main() {
  SearchFilterBloc mockFilterBloc;

  setUp(() {
    mockFilterBloc = MockFilterBloc();
  });

  testWidgets(
    'Displays Search screen without any items',
    (WidgetTester tester) async {
      final testWidget = SearchScreen(filter: [], mushroomsList: []);
      await tester.pumpWidget(buildTestableWidget(testWidget));
      expect(find.text('No items'), findsOneWidget);
    },
  );

  testWidgets(
    'Displays a filter button',
    (WidgetTester tester) async {
      final id = SearchLabels.winter;
      final screen = Scaffold(
        body: FilterButton(id: id, isActive: true, text: 'some text'),
      );
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.text('some text'), findsOneWidget);
      expect(find.byType(FlatButton), findsOneWidget);
    },
  );

  testWidgets(
    'Displays a search tile',
    (WidgetTester tester) async {
      final item = MushroomInfo('name', 'scientific', [SearchLabels.winter]);
      final screen = Scaffold(body: SearchTile(item: item));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.text(item.name), findsOneWidget);
      expect(find.text(item.nameScientific), findsOneWidget);
      expect(find.byType(DetailLabels), findsOneWidget);
    },
  );

  testWidgets(
    'renders filters list',
    (WidgetTester tester) async {
      final List<SearchLabels> tags = [SearchLabels.winter];
      final Widget child = SearchView(filter: [], mushroomsList: []);
      final widget = BlocProvider.value(value: mockFilterBloc, child: child);

      when(mockFilterBloc.state).thenReturn(FilterResultState(tags));
      await tester.pumpWidget(buildTestableWidget(widget));

      expect(find.byType(FilterButton), findsWidgets);
    },
  );

  tearDown(() {
    mockFilterBloc?.close();
  });
}
