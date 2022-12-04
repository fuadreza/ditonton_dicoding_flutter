import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/watchlist_movies/blocs/watchlist_movies_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Now Playing Movie Cubit', () {
    late WatchListMoviesBloc watchListMoviesBloc;
    MockGetWatchlistMovies mockGetWatchlistMovies = MockGetWatchlistMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      watchListMoviesBloc = WatchListMoviesBloc(getWatchlistMovies: mockGetWatchlistMovies);
    });

    test('initial state is correct', () {
      expect(watchListMoviesBloc.state, WatchListMoviesStateLoading());
    });

    blocTest<WatchListMoviesBloc, WatchListMoviesState>(
      'emits states for successful get watchlist',
      setUp: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      },
      build: () => watchListMoviesBloc,
      act: (cubit) => cubit.getWatchlist(),
      expect: () => [
        WatchListMoviesStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<WatchListMoviesBloc, WatchListMoviesState>(
      'emits states for unsuccessful get watchlist',
      setUp: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => watchListMoviesBloc,
      act: (cubit) => cubit.getWatchlist(),
      expect: () => [
        const WatchListMoviesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      watchListMoviesBloc.close();
    });
  });
}
