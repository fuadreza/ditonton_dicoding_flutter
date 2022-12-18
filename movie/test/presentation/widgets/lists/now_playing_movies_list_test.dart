import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/home_movie/blocs/now_playing/now_playing_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/now_playing_movies_list.dart';

import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => NowPlayingMovieBloc(
            getNowPlayingMovies: MockGetNowPlayingMovies(),
          ),
          child: const NowPlayingMovieList(),
        ),
      ),
    );

void main() {
  group('Now Playing Movie List test', () {
    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
