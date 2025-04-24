import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tutorial_card.dart';

void main() {
  group('TutorialCard Widget Tests', () {
    const testImagePath = 'assets/logo/placeholder.jpg';
    const testTitle = 'Test Tutorial';
    const testDescription = 'This is a test tutorial description.';
    const testSupplies = ['Item 1', 'Item 2', 'Item 3'];
    const testInstructions = [
      'Step 1: Do something.',
      'Step 2: Do something else.',
    ];

    Widget createTestWidget() {
      return MaterialApp(
        home: Scaffold(
          body: TutorialCard(
            imagePath: testImagePath,
            title: testTitle,
            description: testDescription,
            supplies: testSupplies,
            instructions: testInstructions,
          ),
        ),
      );
    }

    testWidgets(
      'Renders TutorialCard widget and checks title, description, and image',
      (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.text(testTitle), findsOneWidget);
        expect(find.text(testDescription), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      },
    );
  });
}
