import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/pages/movie_detail/blocs/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/pages/movie_detail/widgets/lists/recommendation_movie_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(MovieRecommendationBloc bloc) =>
    MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => bloc,
          child: const RecommendationMovieList(),
        ),
      ),
    );

void main() {
  group('Recommendation Movie List test', () {
    late MovieRecommendationBloc bloc;
    MockGetMovieRecommendations mockGetMovieRecommendations = MockGetMovieRecommendations();

    const tId = 1;

    setUp(() {
      EquatableConfig.stringify = true;
      bloc = MovieRecommendationBloc(getMovieRecommendations: mockGetMovieRecommendations);
    });

    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing if CachedNetworkImage shows up', (WidgetTester tester) async {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testMovieList));
      bloc.getRecommendations(tId);
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if Error Text shows up', (WidgetTester tester) async {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      bloc.getRecommendations(tId);
      await tester.pumpWidget(createWidget(bloc));
      final finder = find.text('Server Failure');
      expect(finder, findsOneWidget);
    });
  });
}
