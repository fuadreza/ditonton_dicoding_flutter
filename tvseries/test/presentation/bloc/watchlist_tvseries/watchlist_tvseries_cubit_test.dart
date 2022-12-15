import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/watchlist_tvseries/blocs/watchlist_tvseries_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Now Playing TvSeries Cubit', () {
    late WatchListTvSeriesBloc watchListTvSeriesBloc;
    MockGetWatchlistTvSeries mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();

    setUp(() {
      EquatableConfig.stringify = true;
      watchListTvSeriesBloc = WatchListTvSeriesBloc(getWatchlistTvSeries: mockGetWatchlistTvSeries);
    });

    test('initial state is correct', () {
      expect(watchListTvSeriesBloc.state, WatchListTvSeriesStateLoading());
    });

    blocTest<WatchListTvSeriesBloc, WatchListTvSeriesState>(
      'emits states for successful get watchlist',
      setUp: () {
        when(mockGetWatchlistTvSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => watchListTvSeriesBloc,
      act: (cubit) => cubit.getWatchlist(),
      expect: () => [
        WatchListTvSeriesStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<WatchListTvSeriesBloc, WatchListTvSeriesState>(
      'emits states for unsuccessful get watchlist',
      setUp: () {
        when(mockGetWatchlistTvSeries.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => watchListTvSeriesBloc,
      act: (cubit) => cubit.getWatchlist(),
      expect: () => [
        const WatchListTvSeriesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      watchListTvSeriesBloc.close();
    });
  });
}
