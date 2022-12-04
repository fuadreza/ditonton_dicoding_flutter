import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/recommendation/tvseries_recommendation_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Tv Series Recommendation Cubit', () {
    late TvSeriesRecommendationBloc tvSeriesRecommendationBloc;
    MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();

    const tId = 1;
    
    setUp(() {
      EquatableConfig.stringify = true;
      tvSeriesRecommendationBloc = TvSeriesRecommendationBloc(getTvSeriesRecommendations: mockGetTvSeriesRecommendations);
    });

    test('initial state is correct', () {
      expect(tvSeriesRecommendationBloc.state, TvSeriesRecommendationStateLoading());
    });

    blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
      'emits states for successful get recommendation',
      setUp: () {
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => tvSeriesRecommendationBloc,
      act: (cubit) => cubit.getRecommendations(tId),
      expect: () => [
        TvSeriesRecommendationStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<TvSeriesRecommendationBloc, TvSeriesRecommendationState>(
      'emits states for unsuccessful get recommendation',
      setUp: () {
        when(mockGetTvSeriesRecommendations.execute(tId))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => tvSeriesRecommendationBloc,
      act: (cubit) => cubit.getRecommendations(tId),
      expect: () => [
        const TvSeriesRecommendationStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      tvSeriesRecommendationBloc.close();
    });
  });
}