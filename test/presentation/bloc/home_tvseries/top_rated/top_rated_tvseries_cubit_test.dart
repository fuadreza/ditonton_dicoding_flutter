import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Top Rated TvSeries Cubit', () {
    late TopRatedTvSeriesBloc topRatedTvSeriesBloc;
    MockGetTopRatedTvSeries mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();

    setUp(() {
      EquatableConfig.stringify = true;
      topRatedTvSeriesBloc = TopRatedTvSeriesBloc(getTopRatedTvSeries: mockGetTopRatedTvSeries);
    });

    test('initial state is correct', () {
      expect(topRatedTvSeriesBloc.state, TopRatedTvSeriesStateLoading());
    });

    blocTest<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
      'emits states for successful get top rated',
      setUp: () {
        when(mockGetTopRatedTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => topRatedTvSeriesBloc,
      act: (cubit) => cubit.getTopRated(),
      expect: () => [
        TopRatedTvSeriesStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
      'emits states for unsuccessful get top rated',
      setUp: () {
        when(mockGetTopRatedTvSeries.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => topRatedTvSeriesBloc,
      act: (cubit) => cubit.getTopRated(),
      expect: () => [
        const TopRatedTvSeriesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      topRatedTvSeriesBloc.close();
    });
  });
}