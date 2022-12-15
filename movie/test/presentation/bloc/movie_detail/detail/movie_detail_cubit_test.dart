import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/detail/movie_detail_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  late MovieDetailBloc movieDetailBloc;
  MockGetMovieDetail mockGetMovieDetail = MockGetMovieDetail();
  MockGetWatchListStatusMovie mockGetWatchListStatusMovie = MockGetWatchListStatusMovie();
  MockSaveWatchlistMovie mockSaveWatchlistMovie = MockSaveWatchlistMovie();
  MockRemoveWatchlistMovie mockRemoveWatchlistMovie = MockRemoveWatchlistMovie();

  const tId = 1;

  setUp(() {
    EquatableConfig.stringify = true;
    movieDetailBloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetail,
      getWatchListStatus: mockGetWatchListStatusMovie,
      saveWatchlist: mockSaveWatchlistMovie,
      removeWatchlist: mockRemoveWatchlistMovie,
    );
    movieDetailBloc.movieDetail = testMovieDetail;
  });

  group('Movie Detail Cubit', () {
    test('initial state is correct', () {
      expect(movieDetailBloc.state, MovieDetailStateLoading());
    });

    blocTest<MovieDetailBloc, MovieDetailState>(
      'emits states for successful get detail',
      setUp: () {
        when(mockGetMovieDetail.execute(tId)).thenAnswer((_) async => const Right(testMovieDetail));
        when(mockGetWatchListStatusMovie.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      },
      build: () => movieDetailBloc,
      act: (cubit) => cubit.getMovie(tId),
      expect: () => [
        const MovieDetailStateLoaded(movie: testMovieDetail, isAddedToWatchList: true),
      ],
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'emits states for unsuccessful get detail',
      setUp: () {
        when(mockGetMovieDetail.execute(tId)).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
        when(mockGetWatchListStatusMovie.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      },
      build: () => movieDetailBloc,
      act: (cubit) => cubit.getMovie(tId),
      expect: () => [
        const MovieDetailStateFailed(message: 'Server Failure'),
      ],
    );
  });

  group('Movie Detail Cubit Watchlist', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'emits states for successful add watchlist',
      setUp: () {
        when(mockSaveWatchlistMovie.execute(testMovieDetail)).thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchListStatusMovie.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      },
      build: () => movieDetailBloc,
      act: (cubit) => cubit.addWatchList(testMovieDetail),
      expect: () => [
        const MovieDetailStateLoaded(movie: testMovieDetail, isAddedToWatchList: true, message: 'Added to Watchlist'),
      ],
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'emits states for successful remove watchlist',
      setUp: () {
        when(mockRemoveWatchlistMovie.execute(testMovieDetail)).thenAnswer((_) async => const Right('Removed from Watchlist'));
        when(mockGetWatchListStatusMovie.execute(testMovieDetail.id)).thenAnswer((_) async => false);
        movieDetailBloc.isAddedToWatchList = true;
      },
      build: () => movieDetailBloc,
      act: (cubit) => cubit.removeFromWatchList(testMovieDetail),
      expect: () => [
        const MovieDetailStateLoaded(movie: testMovieDetail, isAddedToWatchList: false, message: 'Removed from Watchlist'),
      ],
    );
  });

  tearDown(() {
    movieDetailBloc.close();
  });
}
