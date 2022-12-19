import 'package:core/enums/list_direction.dart';
import 'package:core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/pages/home_tvseries/blocs/top_rated/top_rated_tvseries_bloc.dart';
import 'package:tvseries/presentation/pages/home_tvseries/widgets/lists/top_rated_tvseries_list.dart';
import 'package:tvseries/presentation/pages/home_tvseries/widgets/lists/tvseries_list.dart';
import 'package:tvseries/presentation/widgets/tvseries_card_list.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/mock_usecase_helper.mocks.dart';

Widget createWidget(TopRatedTvSeriesBloc bloc, {ListDirection direction = ListDirection.horizontal}) => MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => bloc,
          child: TopRatedTvSeriesList(listDirection: direction),
        ),
      ),
    );

void main() {
  group('Top Rated TvSeries List test', () {
    late TopRatedTvSeriesBloc bloc;
    MockGetTopRatedTvSeries mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();

    setUp(() {
      EquatableConfig.stringify = true;
      bloc = TopRatedTvSeriesBloc(getTopRatedTvSeries: mockGetTopRatedTvSeries);
    });

    testWidgets('Testing if Circular Progress Indicator shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Testing if TvSeriesList shows up', (WidgetTester tester) async {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc));
      expect(find.byType(TvSeriesList), findsOneWidget);
    });

    testWidgets('Testing if TvSeriesCard shows up', (WidgetTester tester) async {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc, direction: ListDirection.vertical));
      expect(find.byType(TvSeriesCard), findsOneWidget);
    });

    testWidgets('Testing if Error shows up', (WidgetTester tester) async {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      bloc.getTopRated();
      await tester.pumpWidget(createWidget(bloc));
      final finder = find.text('Server Failure');
      expect(finder, findsOneWidget);
    });
  });
}
