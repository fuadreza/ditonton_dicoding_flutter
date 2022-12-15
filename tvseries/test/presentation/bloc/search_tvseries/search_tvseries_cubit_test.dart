import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/failure.dart';
import 'package:tvseries/presentation/pages/search_tvseries/blocs/search_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/search_tvseries/blocs/search_tvseries_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

void main() {
  group('Search Tv Series Cubit', () {
    late SearchTvSeriesBloc searchTvSeriesBloc;
    MockSearchTvSeries mockSearchTvSeries = MockSearchTvSeries();

    const tQuery = 'black';

    setUp(() {
      EquatableConfig.stringify = true;
      searchTvSeriesBloc = SearchTvSeriesBloc(searchTvSeries: mockSearchTvSeries);
    });

    test('initial state is correct', () {
      expect(searchTvSeriesBloc.state, SearchTvSeriesStateInit());
    });

    blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
      'emits states for successful search tv series',
      setUp: () {
        when(mockSearchTvSeries.execute(tQuery))
            .thenAnswer((_) async => Right(testTvSeriesList));
      },
      build: () => searchTvSeriesBloc,
      act: (cubit) => cubit.searchTvSeriesByQuery(tQuery),
      expect: () => [
        SearchTvSeriesStateLoading(),
        SearchTvSeriesStateLoaded(listTvSeries: testTvSeriesList),
      ],
    );

    blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
      'emits states for unsuccessful search tv series',
      setUp: () {
        when(mockSearchTvSeries.execute(tQuery))
            .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      },
      build: () => searchTvSeriesBloc,
      act: (cubit) => cubit.searchTvSeriesByQuery(tQuery),
      expect: () => [
        SearchTvSeriesStateLoading(),
        const SearchTvSeriesStateFailed(message: 'Server Failure'),
      ],
    );

    tearDown(() {
      searchTvSeriesBloc.close();
    });
  });
}