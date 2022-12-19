import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/lists/recommendation_tvseries_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(TvSeriesRecommendationBloc bloc) =>
    MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => bloc,
          child: const RecommendationTvSeriesList(),
        ),
      ),
    );

void main() {
  group('Recommendation TvSeries List test', () {
    late TvSeriesRecommendationBloc bloc;
    MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();

    const tId = 1;

    setUp(() {
      EquatableConfig.stringify = true;
      bloc = TvSeriesRecommendationBloc(getTvSeriesRecommendations: mockGetTvSeriesRecommendations);
    });

    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing if CachedNetworkImage shows up', (WidgetTester tester) async {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesList));
      bloc.getRecommendations(tId);
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if Error Text shows up', (WidgetTester tester) async {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      bloc.getRecommendations(tId);
      await tester.pumpWidget(createWidget(bloc));
      final finder = find.text('Server Failure');
      expect(finder, findsOneWidget);
    });
  });
}
