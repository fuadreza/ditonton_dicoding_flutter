import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/popular/popular_tvseries_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Popular TvSeries Cubit', () {
    late PopularTvSeriesBloc popularTvSeriesBloc;
    MockGetPopularTvSeries mockGetPopularTvSeries = MockGetPopularTvSeries();

    setUp(() {
      EquatableConfig.stringify = true;
      popularTvSeriesBloc = PopularTvSeriesBloc(getPopularTvSeries: mockGetPopularTvSeries);
    });

    test('initial state is correct', () {
      expect(popularTvSeriesBloc.state, PopularTvSeriesStateLoading());
    });

    blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
      'emits states for successful get popular',
      setUp: () {
        when(mockGetPopularTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => popularTvSeriesBloc,
      act: (cubit) => cubit.getPopular(),
      expect: () => [
        PopularTvSeriesStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
      'emits states for unsuccessful get popular',
      setUp: () {
        when(mockGetPopularTvSeries.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => popularTvSeriesBloc,
      act: (cubit) => cubit.getPopular(),
      expect: () => [
        const PopularTvSeriesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      popularTvSeriesBloc.close();
    });
  });
}