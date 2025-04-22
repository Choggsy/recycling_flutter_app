import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/material/metal_page.dart';

void main() {
  testWidgets('Page has a title and body text', (final WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: MetalPage()));

    expect(find.text('Metal'), findsOneWidget);
    expect(find.text('This is the Metal page'), findsOneWidget);
  });
}