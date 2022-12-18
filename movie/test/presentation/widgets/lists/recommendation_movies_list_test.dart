import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/widgets/lists/recommendation_movie_list.dart';

import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => MovieRecommendationBloc(
            getMovieRecommendations: MockGetMovieRecommendations(),
          ),
          child: const RecommendationMovieList(),
        ),
      ),
    );

void main() {
  group('Recommendation Movie List test', () {
    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
