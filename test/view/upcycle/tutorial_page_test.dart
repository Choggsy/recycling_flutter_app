import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tutorial_card.dart';
import 'package:recycling_flutter_app/model/tutorial.dart';
import 'package:recycling_flutter_app/view/upcycle/tutorial_page.dart';

void main() {
  // Sample tutorial data for testing
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

  Future<Tutorial> mockLoadTutorial() async => testTutorial;

  Future<Tutorial> mockLoadError() async {
    throw Exception('Error loading tutorial');
  }

  Future<Tutorial> mockLoadEmpty() async =>  Tutorial(
    imagePath: '',
    title: 'Unknown Tutorial',
    description: '',
    supplies: [],
    instructions: [],
    categories: [],
  );

  group('TutorialPage Widget Tests', () {
    Widget createTestWidget(Future<Tutorial> Function()? mockLoader) {
      return MaterialApp(
        home: TutorialPage(
          tutorialTitle: 'Test Tutorial',
          tutorialLoader: mockLoader, // Mock loader injected for testing
        ),
      );
    }

    testWidgets('Displays loading indicator during fetch', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));

      // Check for loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Displays error widget when fetch fails', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadError));

      // Wait for error to propagate
      await tester.pumpAndSettle();
      expect(find.text('Error loading tutorial'), findsOneWidget);
    });

    testWidgets('Displays empty widget when no data is found', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadEmpty));

      // Check for empty widget
      await tester.pumpAndSettle();
      expect(find.text('No tutorial available'), findsOneWidget);
    });

    testWidgets('Renders tutorial card with valid data', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));
      await tester.pumpAndSettle();

      // Verify the TutorialCard widget is rendered correctly
      expect(find.byType(TutorialCard), findsOneWidget);

      // Verify title, description, and instructions
      expect(find.text(testTutorial.title), findsOneWidget);
      expect(find.text(testTutorial.description), findsOneWidget);
      for (final instruction in testTutorial.instructions) {
        expect(find.text('- $instruction'), findsOneWidget);
      }

      // Verify supplies
      expect(find.text(testTutorial.supplies.join(', ')), findsOneWidget);
    });
  });
}