import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;

import 'package:recycling_flutter_app/view/home_page.dart' show HomePage;

void main() {
  testWidgets('HomePage has a title and body text', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verify the title in the app bar
    expect(find.widgetWithText(CustomAppBar, 'Home'), findsOneWidget);

    // Verify the body text
    expect(find.text('Home Page'), findsOneWidget);
  });
}
