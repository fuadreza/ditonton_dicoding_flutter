import 'package:ditonton_dicoding_flutter/presentation/widgets/season_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: SeasonChip(
          season: testSeason,
          tvId: testSeason.id,
        ),
      ),
    );

void main() {
  group('Season Chip test', () {
    testWidgets('Testing if Season Chip shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
