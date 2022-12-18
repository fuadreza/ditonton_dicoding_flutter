import 'package:core/enums/list_direction.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/movie_list.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/top_rated_movies_list.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(TopRatedMovieBloc bloc, {ListDirection direction = ListDirection.horizontal}) => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => bloc,
          child: TopRatedMovieList(listDirection: direction),
        ),
      ),
    );

void main() {
  group('Top Rated Movie List test', () {
    late TopRatedMovieBloc bloc;
    MockGetTopRatedMovies mockGetTopRatedMovies = MockGetTopRatedMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      bloc = TopRatedMovieBloc(getTopRatedMovies: mockGetTopRatedMovies);
    });

    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing if MovieList shows up', (WidgetTester tester) async {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(MovieList), findsOneWidget);
    });

    testWidgets('Testing if MovieCard shows up', (WidgetTester tester) async {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc, direction: ListDirection.vertical));
      expect(find.byType(MovieCard), findsOneWidget);
    });

    testWidgets('Testing if Error shows up', (WidgetTester tester) async {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc));
      final finder = find.text('Server Failure');
      expect(finder, findsOneWidget);
    });
  });
}
