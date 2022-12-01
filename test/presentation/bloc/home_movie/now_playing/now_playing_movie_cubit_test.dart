import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Now Playing Movie Cubit', () {
    late NowPlayingMovieBloc nowPlayingMovieBloc;
    MockGetNowPlayingMovies mockGetNowPlayingMovies = MockGetNowPlayingMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      nowPlayingMovieBloc = NowPlayingMovieBloc(getNowPlayingMovies: mockGetNowPlayingMovies);
    });

    test('initial state is correct', () {
      expect(nowPlayingMovieBloc.state, NowPlayingMovieStateLoading());
    });

    blocTest<NowPlayingMovieBloc, NowPlayingMovieState>(
      'emits states for successful get now playing',
      setUp: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
      },
      build: () => nowPlayingMovieBloc,
      act: (cubit) => cubit.getNowPlaying(),
      expect: () => [
        NowPlayingMovieStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<NowPlayingMovieBloc, NowPlayingMovieState>(
      'emits states for unsuccessful get now playing',
      setUp: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => nowPlayingMovieBloc,
      act: (cubit) => cubit.getNowPlaying(),
      expect: () => [
        const NowPlayingMovieStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      nowPlayingMovieBloc.close();
    });
  });
}