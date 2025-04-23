import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/logo/non_regulate_logo_page.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';

void main() {
  testWidgets('NonRegulatedLogoPage has a title', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.text('Logos Guide'), findsOneWidget);
  });

  testWidgets('NonRegulatedLogoPage has buttons', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.widgetWithText(TileButton, 'Recyclable'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Sustainable'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Non Regulated'), findsOneWidget);
  });

  testWidgets('NonRegulatedLogoPage navigates back to GuidelinesPage', (final WidgetTester tester) async {
    await buildPage(tester);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(GuidelinesPage), findsOneWidget);
  });
}

Future<void> buildPage(final WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: NonRegulatedLogoPage(),
    ),
  );
}
