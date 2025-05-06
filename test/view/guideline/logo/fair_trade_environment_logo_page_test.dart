import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/fair_trade_environment_logo_page.dart';

@GenerateMocks([AssetBundle])
void main() {
  testWidgets('FairTradeEnvironmentalLogoPage has a title', (
    final WidgetTester tester,
  ) async {
    await buildPage(tester);

    expect(find.text('Logos Guide'), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage has buttons', (
    final WidgetTester tester,
  ) async {
    await buildPage(tester);

    expect(find.widgetWithText(TileButton, 'Recyclable Logos'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Sustainable'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Non Regulated'), findsOneWidget);
  });

  testWidgets(
    'FairTradeEnvironmentalLogoPage navigates back to GuidelinesPage',
    (final WidgetTester tester) async {
      await buildPage(tester);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(GuidelinesPage), findsOneWidget);
    },
  );
}

Future buildMock(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: FairTradeEnvironmentalLogoPage()));
}

Future buildPage(final WidgetTester tester) async {
  await buildMock(tester);
}
