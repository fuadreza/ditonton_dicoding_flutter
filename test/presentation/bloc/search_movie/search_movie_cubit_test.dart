import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:movie/presentation/pages/search_movie/blocs/search_movie_bloc.dart';
import 'package:movie/presentation/pages/search_movie/blocs/search_movie_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Search Movie Cubit', () {
    late SearchMovieBloc searchMovieBloc;
    MockSearchMovies mockSearchMovies = MockSearchMovies();

    const tQuery = 'spiderman';

    setUp(() {
      EquatableConfig.stringify = true;
      searchMovieBloc = SearchMovieBloc(searchMovies: mockSearchMovies);
    });

    test('initial state is correct', () {
      expect(searchMovieBloc.state, SearchMovieStateInit());
    });

    blocTest<SearchMovieBloc, SearchMovieState>(
      'emits states for successful search movie',
      setUp: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Right(testMovieList));
      },
      build: () => searchMovieBloc,
      act: (cubit) => cubit.searchMovieByQuery(tQuery),
      expect: () => [
        SearchMovieStateLoading(),
        SearchMovieStateLoaded(listMovie: testMovieList),
      ],
    );

    blocTest<SearchMovieBloc, SearchMovieState>(
      'emits states for unsuccessful search movie',
      setUp: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => searchMovieBloc,
      act: (cubit) => cubit.searchMovieByQuery(tQuery),
      expect: () => [
        SearchMovieStateLoading(),
        const SearchMovieStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      searchMovieBloc.close();
    });
  });
}