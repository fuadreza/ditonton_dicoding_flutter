import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_bloc.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/blocs/season/tvseries_detail_season_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Tv Series Detail Season Cubit', () {
    late TvSeriesDetailSeasonBloc tvSeriesDetailSeasonBloc;
    MockGetTvSeriesSeasonDetail mockGetTvSeriesSeasonDetail = MockGetTvSeriesSeasonDetail();

    setUp(() {
      EquatableConfig.stringify = true;
      tvSeriesDetailSeasonBloc = TvSeriesDetailSeasonBloc(getTvSeriesSeasonDetail: mockGetTvSeriesSeasonDetail);
    });

    test('initial state is correct', () {
      expect(tvSeriesDetailSeasonBloc.state, TvSeriesDetailSeasonStateLoading());
    });

    blocTest<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
      'emits states for successful get recommendation',
      setUp: () {
        when(mockGetTvSeriesSeasonDetail.execute(testSeason.id, testSeason.seasonNumber))
            .thenAnswer((_) async => const Right(testSeasonDetail));
      },
      build: () => tvSeriesDetailSeasonBloc,
      act: (cubit) => cubit.getSeasons(testSeason.id, testSeason.seasonNumber),
      expect: () => [
        TvSeriesDetailSeasonStateLoaded(seasonDetail: testSeasonDetail),
      ],
    );

    blocTest<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
      'emits states for unsuccessful get recommendation',
      setUp: () {
        when(mockGetTvSeriesSeasonDetail.execute(testSeason.id, testSeason.seasonNumber))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => tvSeriesDetailSeasonBloc,
      act: (cubit) => cubit.getSeasons(testSeason.id, testSeason.seasonNumber),
      expect: () => [
        const TvSeriesDetailSeasonStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      tvSeriesDetailSeasonBloc.close();
    });
  });
}