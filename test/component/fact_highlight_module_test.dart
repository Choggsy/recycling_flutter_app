import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/fact_highlight_module.dart';
import 'package:recycling_flutter_app/model/fact.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/fact_page.dart';

void main() {
  final mockFacts = [
    RecyclingFact(id: 1, title: 'Fact 1', description: 'Description 1'),
    RecyclingFact(id: 2, title: 'Fact 2', description: 'Description 2'),
    RecyclingFact(id: 3, title: 'Fact 3', description: 'Description 3'),
  ];

  testWidgets('displays title and See All button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: RecyclingFactsSection(facts: mockFacts)),
    ));

    expect(find.text('Recycling Facts'), findsOneWidget);
    expect(find.text('See All'), findsOneWidget);
  });

  testWidgets('displays only the first two facts', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: RecyclingFactsSection(facts: mockFacts)),
    ));

    expect(find.text('Fact 1'), findsOneWidget);
    expect(find.text('Fact 2'), findsOneWidget);
    expect(find.text('Fact 3'), findsNothing);
  });

  testWidgets('navigates to RecyclingFactPage on See All tap', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RecyclingFactsSection(facts: mockFacts),
    ));

    await tester.tap(find.text('See All'));
    await tester.pumpAndSettle();

    expect(find.byType(RecyclingFactPage), findsOneWidget);
  });
}
