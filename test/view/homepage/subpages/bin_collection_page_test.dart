import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/logo_card.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/bin_collection_page.dart';

void main() {
  group('BinCollectionPage UI Tests', () {
    testWidgets('renders BinCollectionPage without crashing', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.byType(BinCollectionPage), findsOneWidget);
    });

    testWidgets('displays AppBar with correct title', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Bin Page'), findsOneWidget);
    });

    testWidgets('displays back button in AppBar', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('displays exactly 3 LogoCard widgets', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.byType(LogoCard), findsNWidgets(3));
    });

    testWidgets('displays correct title for each LogoCard', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.text('Recycling Bin'), findsOneWidget);
      expect(find.text('Organic Bin'), findsOneWidget);
      expect(find.text('General Waste Bin'), findsOneWidget);
    });

    testWidgets('displays correct description for each LogoCard', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BinCollectionPage()));

      expect(find.text('Used for paper, cardboard, and plastics.'), findsOneWidget);
      expect(find.text('Used for food waste and garden clippings.'), findsOneWidget);
      expect(find.text('Used for non-recyclable household waste.'), findsOneWidget);
    });
  });
}