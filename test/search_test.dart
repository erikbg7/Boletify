import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/detail/detail_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/search/components/filter_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_tile.dart';
import 'package:futter_project_tfg/screens/search/components/search_view.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';

import 'utils/index.dart';

class MockFilterBloc extends MockBloc<FilterEvent, FilterState>
    implements SearchFilterBloc {}

class FallbackState extends Fake implements FilterState {}

class FallbackEvent extends Fake implements FilterEvent {}

void main() {
  late SearchFilterBloc mockFilterBloc;

  setUpAll(() {
    registerFallbackValue<FilterState>(FallbackState());
    registerFallbackValue<FilterEvent>(FallbackEvent());
  });

  setUp(() {
    mockFilterBloc = MockFilterBloc();
  });

  tearDown(() {
    mockFilterBloc.close();
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
    'Displays a search tile',
    (WidgetTester tester) async {
      final item = Mushroom.buildEmpty(
          name: 'name', scientificName: 'scientific', tags: [Tag.winter]);
      final screen = Scaffold(body: SearchTile(item: item));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.text(item.name), findsOneWidget);
      expect(find.text(item.scientificName), findsOneWidget);
    },
  );

  testWidgets(
    'SearchTile redirects to DetailsScreen',
    (WidgetTester tester) async {
      final item = Mushroom.buildEmpty(
          name: 'name', scientificName: 'scientific', tags: [Tag.winter]);
      final screen = Scaffold(body: SearchTile(item: item));
      await tester.pumpWidget(buildTestableWidget(screen));
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.byType(DetailScreen), findsOneWidget);
    },
  );

  testWidgets(
    'renders filters list',
    (WidgetTester tester) async {
      final List<Tag> tags = [Tag.winter];
      final List<Mushroom> list = [
        Mushroom.buildEmpty(
            name: 'name', scientificName: 'scientific', tags: [Tag.winter])
      ];
      final Widget child = SearchView();
      final widget = BlocProvider.value(value: mockFilterBloc, child: child);

      when(() => mockFilterBloc.state)
          .thenReturn(FilterResultState(tags, list));
      await tester.pumpWidget(buildTestableWidget(widget));

      expect(find.byType(FilterButton), findsWidgets);
    },
  );
}
