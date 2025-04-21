import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;

import 'package:recycling_flutter_app/view/upcycle_page.dart' show UpcyclePage;

void main() {
  testWidgets('UpcyclePage has a title and body text', (WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: UpcyclePage()));

    expect(find.widgetWithText(CustomAppBar, 'Upcycling'), findsOneWidget);
    expect(find.text('Upcycle Page'), findsOneWidget);
  });
}