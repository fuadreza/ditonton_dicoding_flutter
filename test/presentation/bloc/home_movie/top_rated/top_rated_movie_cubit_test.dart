import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Top Rated Movie Cubit', () {
    late TopRatedMovieBloc topRatedMovieBloc;
    MockGetTopRatedMovies mockGetTopRatedMovies = MockGetTopRatedMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      topRatedMovieBloc = TopRatedMovieBloc(getTopRatedMovies: mockGetTopRatedMovies);
    });

    test('initial state is correct', () {
      expect(topRatedMovieBloc.state, TopRatedMovieStateLoading());
    });

    blocTest<TopRatedMovieBloc, TopRatedMovieState>(
      'emits states for successful get top rated',
      setUp: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
      },
      build: () => topRatedMovieBloc,
      act: (cubit) => cubit.getTopRated(),
      expect: () => [
        TopRatedMovieStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<TopRatedMovieBloc, TopRatedMovieState>(
      'emits states for unsuccessful get top rated',
      setUp: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => topRatedMovieBloc,
      act: (cubit) => cubit.getTopRated(),
      expect: () => [
        const TopRatedMovieStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      topRatedMovieBloc.close();
    });
  });
}