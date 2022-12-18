import 'package:core/enums/list_direction.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/movie_list.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/popular_movies_list.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(PopularMovieBloc bloc, {ListDirection direction = ListDirection.horizontal}) => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => bloc,
          child: PopularMovieList(listDirection: direction),
        ),
      ),
    );

void main() {
  group('Popular Movie List test', () {
    late PopularMovieBloc bloc;
    MockGetPopularMovies mockGetPopularMovies = MockGetPopularMovies();

    setUp(() {
      EquatableConfig.stringify = true;
      bloc = PopularMovieBloc(getPopularMovies: mockGetPopularMovies);
    });

    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing if MovieList shows up', (WidgetTester tester) async {
      when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      bloc.getPopular();
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(MovieList), findsOneWidget);
    });

    testWidgets('Testing if MovieCard shows up', (WidgetTester tester) async {
      when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      bloc.getPopular();
      await tester.pumpWidget(createWidget(bloc, direction: ListDirection.vertical));
      expect(find.byType(MovieCard), findsOneWidget);
    });

    testWidgets('Testing if Error shows up', (WidgetTester tester) async {
      when(mockGetPopularMovies.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      bloc.getPopular();
      await tester.pumpWidget(createWidget(bloc));
      final finder = find.text('Server Failure');
      expect(finder, findsOneWidget);
    });
  });
}
