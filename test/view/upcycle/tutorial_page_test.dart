import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tutorial_card.dart';
import 'package:recycling_flutter_app/view/upcycle/tutorial_page.dart';

void main() {
  final Map<String, dynamic> strictTypeTestTutorialData = {
    'photo': 'assets/logo/placeholder.jpg',
    'title': 'Test Tutorial',
    'description': 'This is a test tutorial description.',
    'supplies': <String>['Item 1', 'Item 2', 'Item 3'],
    'instructions': <String>[
      'Step 1: Do something.',
      'Step 2: Do something else.'
    ],
  };

  Future<Map<String, dynamic>> mockLoadTutorial() async => strictTypeTestTutorialData;

  Future<Map<String, dynamic>> mockLoadError() async {
    throw Exception('Error loading tutorial');
  }

  Future<Map<String, dynamic>> mockLoadEmpty() async => {
    'photo': '',
    'title': 'Unknown Tutorial',
    'description': '',
    'supplies': [],
    'instructions': [],
  };

  group('TutorialPage Widget Tests', () {
    Widget createTestWidget(Future<Map<String, dynamic>> Function()? mockLoader) {
      return MaterialApp(
        home: TutorialPage(
          tutorialTitle: 'Test Tutorial',
          tutorialLoader: mockLoader, // Mock loader injected for testing
        ),
      );
    }

    testWidgets('Displays loading indicator during fetch', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Displays error widget when fetch fails', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadError));

      await tester.pumpAndSettle();
      expect(find.text('Error loading tutorial'), findsOneWidget);
    });

    testWidgets('Displays empty widget when no data is found', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadEmpty));

      await tester.pumpAndSettle();
      expect(find.text('No tutorial available'), findsOneWidget);
    });

    testWidgets('Renders tutorial card with valid data', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockLoadTutorial));
      await tester.pumpAndSettle();

      expect(find.byType(TutorialCard), findsOneWidget);
      expect(find.text('- Step 1: Do something.'), findsOneWidget);
      expect(find.text(strictTypeTestTutorialData['description'] as String), findsOneWidget);

      expect(find.descendant(of: find.byType(TutorialCard),
        matching: find.text(strictTypeTestTutorialData['title'] as String),), findsOneWidget);
      expect(find.descendant(of: find.byType(TutorialCard),
        matching: find.text(strictTypeTestTutorialData['supplies'].join(',  ')),), findsOneWidget);
    });
  });
}