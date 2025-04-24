import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tutorial_card.dart';
import 'package:recycling_flutter_app/model/tutorial.dart';
import 'package:recycling_flutter_app/view/upcycle/tutorial_page.dart';

void main() {
  final testTutorial = Tutorial(
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

    testWidgets('Displays loading indicator during fetch', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Displays error widget when fetch fails', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadError));
      await tester.pumpAndSettle();

      expect(find.text('Error loading tutorial'), findsOneWidget);
    });

    testWidgets('Displays empty widget when no data is found', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadEmpty));
      await tester.pumpAndSettle();

      expect(find.text('No tutorial available'), findsOneWidget);
    });

    testWidgets('Renders tutorial card with valid data', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));
      await tester.pumpAndSettle();
      final tutorialCard = find.byType(TutorialCard);


      expect(find.byType(TutorialCard), findsOneWidget);
      expect(find.descendant(of: tutorialCard, matching: find.text(testTutorial.title)), findsOneWidget);
      expect(find.descendant(of: tutorialCard, matching: find.text(testTutorial.description)), findsOneWidget);
      for (final instruction in testTutorial.instructions) {
        expect(find.descendant(of: tutorialCard, matching: find.text('- $instruction')), findsOneWidget);
      }
    });
  });
}