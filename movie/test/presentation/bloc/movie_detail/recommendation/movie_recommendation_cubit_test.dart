import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Movie Recommendation Cubit', () {
    late MovieRecommendationBloc movieRecommendationBloc;
    MockGetMovieRecommendations mockGetMovieRecommendations = MockGetMovieRecommendations();

    const tId = 1;
    
    setUp(() {
      EquatableConfig.stringify = true;
      movieRecommendationBloc = MovieRecommendationBloc(getMovieRecommendations: mockGetMovieRecommendations);
    });

    test('initial state is correct', () {
      expect(movieRecommendationBloc.state, MovieRecommendationStateLoading());
    });

    blocTest<MovieRecommendationBloc, MovieRecommendationState>(
      'emits states for successful get recommendation',
      setUp: () {
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testMovieList));
      },
      build: () => movieRecommendationBloc,
      act: (cubit) => cubit.getRecommendations(tId),
      expect: () => [
        MovieRecommendationStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<MovieRecommendationBloc, MovieRecommendationState>(
      'emits states for unsuccessful get recommendation',
      setUp: () {
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => movieRecommendationBloc,
      act: (cubit) => cubit.getRecommendations(tId),
      expect: () => [
        const MovieRecommendationStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      movieRecommendationBloc.close();
    });
  });
}