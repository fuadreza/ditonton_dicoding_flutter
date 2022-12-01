import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_tvseries/blocs/now_playing/now_playing_tvseries_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Now Playing Tv Series Cubit', () {
    late NowPlayingTvSeriesBloc nowPlayingTvSeriesBloc;
    MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();

    setUp(() {
      EquatableConfig.stringify = true;
      nowPlayingTvSeriesBloc = NowPlayingTvSeriesBloc(getNowPlayingTvSeries: mockGetNowPlayingTvSeries);
    });

    test('initial state is correct', () {
      expect(nowPlayingTvSeriesBloc.state, NowPlayingTvSeriesStateLoading());
    });

    blocTest<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
      'emits states for successful get now playing',
      setUp: () {
        when(mockGetNowPlayingTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => nowPlayingTvSeriesBloc,
      act: (cubit) => cubit.getNowPlaying(),
      expect: () => [
        NowPlayingTvSeriesStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
      'emits states for unsuccessful get now playing',
      setUp: () {
        when(mockGetNowPlayingTvSeries.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => nowPlayingTvSeriesBloc,
      act: (cubit) => cubit.getNowPlaying(),
      expect: () => [
        const NowPlayingTvSeriesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      nowPlayingTvSeriesBloc.close();
    });
  });
}