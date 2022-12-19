import 'package:tvseries/presentation/pages/home_tvseries/widgets/labels/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidget() => MaterialApp(
      home: Scaffold(
        body: SubHeading(title: 'title', onTap: () {}),
      ),
    );

void main() {
  group('Sub Heading test', () {
    testWidgets('Testing if Sub heading Text shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('Testing if Inkwell shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(InkWell), findsOneWidget);
    });
  });
}
