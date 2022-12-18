import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/presentation/pages/home_movie/widgets/lists/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: MovieList(testMovieList),
      ),
    );

void main() {
  group('Movie List test', () {
    testWidgets('Testing if Movie Image shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('Testing if Inkwell shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(InkWell), findsOneWidget);
    });
  });
}
