import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/material/food_waste_page.dart';

void main() {
  testWidgets('Page has a title and body text', (final WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: FoodWastePage()));

    expect(find.text('Food Waste'), findsOneWidget);
    expect(find.text('This is the Food Waste page'), findsOneWidget);
  });
}