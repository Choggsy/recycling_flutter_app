import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/fact_card.dart';
import 'package:recycling_flutter_app/model/fact.dart';

void main() {
  testWidgets('RecyclingFactCard displays title, description, and icon', (WidgetTester tester,) async {
    await buildCard(tester);

    expect(find.text('Recycling Tip'), findsOneWidget);
    expect(find.text('Always rinse containers before recycling.'), findsOneWidget,);
    expect(find.byIcon(Icons.recycling), findsOneWidget);
  });
}

Future<void> buildCard(final WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: RecyclingFactCard(
          fact: RecyclingFact(
            id: 1,
            title: 'Recycling Tip',
            description: 'Always rinse containers before recycling.',
          ),
        ),
      ),
    ),
  );
}
