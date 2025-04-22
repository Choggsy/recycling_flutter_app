import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/logo/fair_trade_environment_logo_page.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart' show GuidelinesPage;

void main() {
  testWidgets('FairTradeEnvironmentalPage has a back button that navigates to GuidelinesPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FairTradeEnvironmentalLogoPage()));
    expect(find.text('Logos Guide'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.byType(GuidelinesPage), findsOneWidget);
  });
}
