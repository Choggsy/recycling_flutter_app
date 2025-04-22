import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/material/cardboard_page.dart' show CardboardPage;

void main() {
  testWidgets('Page has a title and body text', (final WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: CardboardPage()));

    expect(find.text('Cardboard'), findsOneWidget);
    expect(find.text('This is the Cardboard page'), findsOneWidget);
  });
}
