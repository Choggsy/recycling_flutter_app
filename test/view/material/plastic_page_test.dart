import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/material/plastic_page.dart';

void main() {
  testWidgets('Page has a title and body text', (final WidgetTester tester,) async {
    await tester.pumpWidget(MaterialApp(home: PlasticPage()));

    expect(find.text('Plastic'), findsOneWidget);
    expect(find.text('This is the Plastic page'), findsOneWidget);
  });
}
