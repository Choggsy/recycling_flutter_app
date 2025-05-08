import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/news_page.dart';

void main() {
  testWidgets('NewsPage shows loading indicator', (final WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NewsPage()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
