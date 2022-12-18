import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/widgets/contents/detail_movie_content.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(bool isAddedToWatchList) {
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (_) => MovieRecommendationBloc(
          getMovieRecommendations: MockGetMovieRecommendations(),
        ),
        child: DetailMovieContent(testMovieDetail, isAddedToWatchList),
      ),
    ),
  );
}

void main() {
  group('Detail Movie test', () {
    testWidgets('Testing if CachedNetworkImage shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(true));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if Movie Title shows up', (WidgetTester tester) async {
      final finder = find.text(testMovieDetail.title);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing if Movie Icon is Icon.check', (WidgetTester tester) async {
      final finder = find.byIcon(Icons.check);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });

    testWidgets('Testing Movie Genre', (WidgetTester tester) async {
      final finder = find.text(testMovieDetail.genres.first.name);
      await tester.pumpWidget(createWidget(true));
      expect(finder, findsOneWidget);
    });
  });
}
