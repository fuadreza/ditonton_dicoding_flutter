import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton_dicoding_flutter/common/failure.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/home_movie/blocs/popular/popular_movie_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Popular Movie Cubit', () {
    late PopularMovieBloc popularMovieBloc;
    MockGetPopularMovies mockGetPopularMovies = MockGetPopularMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      popularMovieBloc = PopularMovieBloc(getPopularMovies: mockGetPopularMovies);
    });

    test('initial state is correct', () {
      expect(popularMovieBloc.state, PopularMovieStateLoading());
    });

    blocTest<PopularMovieBloc, PopularMovieState>(
      'emits states for successful get popular',
      setUp: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
      },
      build: () => popularMovieBloc,
      act: (cubit) => cubit.getPopular(),
      expect: () => [
        PopularMovieStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<PopularMovieBloc, PopularMovieState>(
      'emits states for unsuccessful get popular',
      setUp: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => popularMovieBloc,
      act: (cubit) => cubit.getPopular(),
      expect: () => [
        const PopularMovieStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      popularMovieBloc.close();
    });
  });
}