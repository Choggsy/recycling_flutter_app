import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tutorial_card.dart';
import 'package:recycling_flutter_app/model/tutorial.dart';

void main() {
  group('TutorialCard Widget Tests', () {
    var testTutorial = Tutorial(
      imagePath: 'assets/logo/placeholder.jpg',
      title: 'Test Tutorial',
      description: 'This is a test tutorial description.',
      supplies: ['Item 1', 'Item 2', 'Item 3'],
      instructions: [
        'Step 1: Do something.',
        'Step 2: Do something else.',
      ],
      categories: ['test'],
    );

    Widget createTestWidget() {
      return MaterialApp(
        home: Scaffold(
          body: TutorialCard(tutorial: testTutorial),
        ),
      );
    }

    testWidgets(
      'Renders TutorialCard widget and checks title, description, and image',
          (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Verify title, description, and image are displayed
        expect(find.text(testTutorial.title), findsOneWidget);
        expect(find.text(testTutorial.description), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      },
    );

    testWidgets(
      'Renders TutorialCard widget and checks supplies and instructions',
          (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Verify supplies are displayed
        for (final supply in testTutorial.supplies) {
          expect(find.text(supply), findsOneWidget);
        }

        // Verify instructions are displayed
        for (final instruction in testTutorial.instructions) {
          expect(find.text('- $instruction'), findsOneWidget);
        }
      },
    );
  });
}