import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/contents/detail_season_content.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/lists/season_episodes_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(bool isAddedToWatchList) {
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (_) => TvSeriesRecommendationBloc(
          getTvSeriesRecommendations: MockGetTvSeriesRecommendations(),
        ),
        child: const DetailSeasonContent(seasonDetail: testSeasonDetail),
      ),
    ),
  );
}

void main() {
  group('Detail Season test', () {
    testWidgets('Testing if Airdate shows up', (WidgetTester tester) async {
      final finder = find.text(testSeasonDetail.airDate);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing if Season Episode Length shows up', (WidgetTester tester) async {
      final finder = find.text(testSeasonDetail.episodes.length.toString());
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing Season Name', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(true));
      expect(find.byType(SeasonEpisodesList), findsOneWidget);
    });
  });
}
