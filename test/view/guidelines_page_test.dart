import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;

import 'package:recycling_flutter_app/view/guidelines_page.dart'
    show GuidelinesPage;

void main() {
  testWidgets('GuidelinesPage has a title and body text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: GuidelinesPage()));

    // Verify the title in the app bar
    expect(find.widgetWithText(CustomAppBar, 'Guidelines'), findsOneWidget);

    // Verify the body text
    expect(find.text('Guidelines Page'), findsOneWidget);
  });
}