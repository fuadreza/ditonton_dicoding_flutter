
import 'package:ditonton_dicoding_flutter/presentation/widgets/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidget() => MaterialApp(
  home: Column(
    children: const [
      EmptyList(),
    ],
  ),
);

void main() {
  group('Empty List test', () {
    testWidgets('Testing if Empty List shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Expanded), findsOneWidget);
    });

    testWidgets('Testing if Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Text), findsOneWidget);
    });
  });
}