import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';

import '../../../dummy_data/dummy_objects.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: TvSeriesList(testTvSeriesList),
      ),
    );

void main() {
  group('TvSeries List test', () {
    testWidgets('Testing if TvSeries Image shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if Inkwell shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(InkWell), findsOneWidget);
    });
  });
}
