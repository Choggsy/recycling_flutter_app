import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/logo/non_regulate_logo_page.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';

void main() {
  testWidgets('NonRegulatedPage has a back button that navigates to GuidelinesPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NonRegulatedLogoPage()));
    expect(find.text('Logos Guide'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.byType(GuidelinesPage), findsOneWidget);
  });
}
