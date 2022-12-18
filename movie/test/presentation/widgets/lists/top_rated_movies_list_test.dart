import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/home_movie/blocs/top_rated/top_rated_movie_bloc.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/top_rated_movies_list.dart';

import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => TopRatedMovieBloc(
            getTopRatedMovies: MockGetTopRatedMovies(),
          ),
          child: const TopRatedMovieList(),
        ),
      ),
    );

void main() {
  group('Top Rated Movie List test', () {
    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
