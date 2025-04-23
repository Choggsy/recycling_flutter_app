import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/material_card.dart';

void main() {
  group('MaterialCard Widget Tests', () {
    const String testDescription = 'This is a test description.';

    testWidgets('displays appropriate font sizes for description', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(375, 667);
      tester.view.devicePixelRatio = 2.0;
      await buildPage(tester, testDescription);

      // Verify description font size for phone screen
      final descriptionText = tester.widget<Text>(find.text(testDescription));
      expect(descriptionText.style?.fontSize, 14.0);

      // Reset the screen size
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });
}

Future<void> buildPage(WidgetTester tester, String testDescription) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MaterialCard(
        imagePath: 'assets/logo/placeholder.jpg',
        title: 'Test Title',
        description: testDescription,
        contaminators: ['Plastic', 'Metal'],
      ),
    ),
  );
}