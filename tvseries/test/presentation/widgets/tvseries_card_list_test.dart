import 'package:tvseries/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: TvSeriesCard(testTvSeries),
      ),
    );

void main() {
  group('Tv Series Card test', () {
    testWidgets('Testing if Movie Card shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
