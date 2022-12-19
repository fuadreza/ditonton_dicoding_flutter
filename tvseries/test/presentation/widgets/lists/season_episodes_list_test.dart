import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/lists/season_episodes_list.dart';

import '../../../dummy_data/dummy_objects.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: SeasonEpisodesList(episodes: testSeasonDetail.episodes),
      ),
    );

void main() {
  group('Season Episode List test', () {
    testWidgets('Testing if Season Episode shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('Testing if Texts shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
