import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/logo_card.dart';
import 'package:recycling_flutter_app/view/guideline/logo/fair_trade_environment_logo_page.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'dart:convert';

@GenerateMocks([AssetBundle])
void main() {
  testWidgets('FairTradeEnvironmentalLogoPage has a title', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.text('Logos Guide'), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage has buttons', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.widgetWithText(TileButton, 'Recyclable Logos'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Sustainable'), findsOneWidget);
    expect(find.widgetWithText(TileButton, 'Non Regulated'), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage navigates back to GuidelinesPage', (final WidgetTester tester) async {
    await buildPage(tester);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(GuidelinesPage), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage loads JSON data correctly', (final WidgetTester tester) async {
    final mockBundle = MockAssetBundle();
    when(mockBundle.loadString('assets/logos.json')).thenAnswer((_) async => json.encode({
      'sustainable': [
        {'imagePath': 'path/to/image', 'title': 'Title', 'description': 'Description'}
      ]
    }));

    await tester.pumpWidget(
      MaterialApp(
        home: FairTradeEnvironmentalLogoPage(),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.byType(LogoCard), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage handles JSON loading error', (final WidgetTester tester) async {
    final mockBundle = MockAssetBundle();
    when(mockBundle.loadString('assets/logos.json')).thenThrow(Exception('Error loading JSON'));

    await tester.pumpWidget(
      MaterialApp(
        home: FairTradeEnvironmentalLogoPage(),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.text('Error loading logos'), findsOneWidget);
  });

  testWidgets('FairTradeEnvironmentalLogoPage handles empty JSON data', (final WidgetTester tester) async {
    final mockBundle = MockAssetBundle();
    when(mockBundle.loadString('assets/logos.json')).thenAnswer((_) async => json.encode({'sustainable': []}));

    await tester.pumpWidget(
      MaterialApp(
        home: FairTradeEnvironmentalLogoPage(),
      ),
    );

    await tester.pump();
    await tester.pump();

    expect(find.byType(LogoCard), findsNothing);
  });
}

Future<void> buildPage(final WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: FairTradeEnvironmentalLogoPage(),
    ),
  );
}