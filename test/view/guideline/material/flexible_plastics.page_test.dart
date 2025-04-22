import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/material/flexible_plastics.page.dart';

void main() {
  testWidgets('Page has a title and body text', (final WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: FlexiblePlasticsPage()));

    expect(find.text('Flexible Plastics'), findsOneWidget);
    expect(find.text('This is the Flexible Plastics page'), findsOneWidget);
  });
}