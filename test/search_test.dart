import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/bloc/filter/filters_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
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

//  testWidgets(
//    'Displays a filter button',
//    (WidgetTester tester) async {
//      final tag = Tag.winter;
//      final screen = Scaffold(
//        body: FilterButton(
//            tag: tag,
//            isActive: true,
//            imageUrl: '/assets/backgrounds/forest.jpeg'),
//      );
//      await tester.pumpWidget(buildTestableWidget(screen));
//      expect(find.byType(Material), findsOneWidget);
//    },
//  );

  testWidgets(
    'Displays a search tile',
    (WidgetTester tester) async {
      final item = MushroomInfo.buildEmpty(
          name: 'name', scientificName: 'scientific', tags: [Tag.winter]);
      final screen = Scaffold(body: SearchTile(item: item));
      await tester.pumpWidget(buildTestableWidget(screen));
      expect(find.text(item.name), findsOneWidget);
      expect(find.text(item.scientificName), findsOneWidget);
    },
  );

  testWidgets(
    'renders filters list',
    (WidgetTester tester) async {
      final List<Tag> tags = [Tag.winter];
      final List<MushroomInfo> list = [
        MushroomInfo.buildEmpty(
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
