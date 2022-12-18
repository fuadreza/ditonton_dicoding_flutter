import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/home_movie/blocs/popular/popular_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/popular_movies_list.dart';

import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => PopularMovieBloc(
            getPopularMovies: MockGetPopularMovies(),
          ),
          child: const PopularMovieList(),
        ),
      ),
    );

void main() {
  group('Popular Movie List test', () {
    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
