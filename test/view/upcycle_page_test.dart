import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/layout_widgets/top_app_bar.dart'
    show CustomAppBar;
import 'package:recycling_flutter_app/view/upcycle_page.dart' show UpcyclePage;

void main() {
  testWidgets('UpcyclePage has a title and body text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: UpcyclePage()));

    // Verify the title in the app bar
    expect(find.widgetWithText(CustomAppBar, 'Reuse'), findsOneWidget);

    // Verify the body text
    expect(find.text('Reuse Page'), findsOneWidget);
  });
}