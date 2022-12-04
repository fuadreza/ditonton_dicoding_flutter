import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/blocs/detail/tvseries_detail_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  late TvSeriesDetailBloc tvSeriesDetailBloc;
  MockGetTvSeriesDetail mockGetTvSeriesDetail = MockGetTvSeriesDetail();
  MockGetWatchListStatusTvSeries mockGetWatchListStatusTvSeries = MockGetWatchListStatusTvSeries();
  MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
  MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();

  const tId = 1;

  setUp(() {
    EquatableConfig.stringify = true;
    tvSeriesDetailBloc = TvSeriesDetailBloc(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getWatchListStatus: mockGetWatchListStatusTvSeries,
      saveWatchlist: mockSaveWatchlistTvSeries,
      removeWatchlist: mockRemoveWatchlistTvSeries,
    );
    tvSeriesDetailBloc.tvSeriesDetail = testTvSeriesDetail;
  });

  group('TvSeries Detail Cubit', () {
    test('initial state is correct', () {
      expect(tvSeriesDetailBloc.state, TvSeriesDetailStateLoading());
    });

    blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
      'emits states for successful get detail',
      setUp: () {
        when(mockGetTvSeriesDetail.execute(tId)).thenAnswer((_) async => const Right(testTvSeriesDetail));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      },
      build: () => tvSeriesDetailBloc,
      act: (cubit) => cubit.getTvSeries(tId),
      expect: () => [
        const TvSeriesDetailStateLoaded(tvSeries: testTvSeriesDetail, isAddedToWatchList: true),
      ],
    );

    blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
      'emits states for unsuccessful get detail',
      setUp: () {
        when(mockGetTvSeriesDetail.execute(tId)).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      },
      build: () => tvSeriesDetailBloc,
      act: (cubit) => cubit.getTvSeries(tId),
      expect: () => [
        const TvSeriesDetailStateFailed(message: 'Server Failure'),
      ],
    );
  });

  group('TvSeries Detail Cubit Watchlist', () {
    blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
      'emits states for successful add watchlist',
      setUp: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      },
      build: () => tvSeriesDetailBloc,
      act: (cubit) => cubit.addWatchList(testTvSeriesDetail),
      expect: () => [
        const TvSeriesDetailStateLoaded(tvSeries: testTvSeriesDetail, isAddedToWatchList: true, message: 'Added to Watchlist'),
      ],
    );

    blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
      'emits states for successful remove watchlist',
      setUp: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => const Right('Removed from Watchlist'));
        when(mockGetWatchListStatusTvSeries.execute(testTvSeriesDetail.id)).thenAnswer((_) async => false);
        tvSeriesDetailBloc.isAddedToWatchList = true;
      },
      build: () => tvSeriesDetailBloc,
      act: (cubit) => cubit.removeFromWatchList(testTvSeriesDetail),
      expect: () => [
        const TvSeriesDetailStateLoaded(tvSeries: testTvSeriesDetail, isAddedToWatchList: false, message: 'Removed from Watchlist'),
      ],
    );
  });

  tearDown(() {
    tvSeriesDetailBloc.close();
  });
}
