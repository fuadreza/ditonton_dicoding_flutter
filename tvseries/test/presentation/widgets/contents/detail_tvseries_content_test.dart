import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/contents/detail_tvseries_content.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(bool isAddedToWatchList) {
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (_) => TvSeriesRecommendationBloc(
          getTvSeriesRecommendations: MockGetTvSeriesRecommendations(),
        ),
        child: DetailTvSeriesContent(testTvSeriesDetail, isAddedToWatchList),
      ),
    ),
  );
}

void main() {
  group('Detail TvSeries test', () {
    testWidgets('Testing if CachedNetworkImage shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(true));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if TvSeries Title shows up', (WidgetTester tester) async {
      final finder = find.text(testTvSeriesDetail.name);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing if TvSeries Icon is Icon.check', (WidgetTester tester) async {
      final finder = find.byIcon(Icons.check);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing TvSeries Genre', (WidgetTester tester) async {
      final finder = find.text(testTvSeriesDetail.genres.first.name);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });
  });
}
