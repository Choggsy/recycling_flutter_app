import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/mosaic_buttons.dart' show MosaicButtons;
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;
import 'package:recycling_flutter_app/view/guideline/material/cardboard_page.dart' show CardboardPage;
import 'package:recycling_flutter_app/view/guideline/material/electionics_page.dart' show ElectronicsPage;
import 'package:recycling_flutter_app/view/guideline/material/flexible_plastics.page.dart' show FlexiblePlasticsPage;
import 'package:recycling_flutter_app/view/guideline/material/glass_page.dart' show GlassPage;
import 'package:recycling_flutter_app/view/guideline/material/plastic_page.dart' show PlasticPage;
import 'package:recycling_flutter_app/view/guideline/material/metal_page.dart' show MetalPage;
import 'package:recycling_flutter_app/view/guideline/material/textiles_page.dart' show TextilesPage;
import 'package:recycling_flutter_app/view/guideline/material/wood_page.dart' show WoodPage;
import 'package:recycling_flutter_app/view/guideline/material/food_waste_page.dart' show FoodWastePage;

void main() {
  final List<MapEntry<String, int>> testData = [
    MapEntry('Cardboard', 0),
    MapEntry('Glass', 1),
    MapEntry('Plastic', 2),
    MapEntry('Electronics', 3),
    MapEntry('Food Waste', 4),
    MapEntry('Metal', 5),
    MapEntry('Textiles', 6),
    MapEntry('Wood', 7),
    MapEntry('Flexible Plastic', 8),
  ];

  testWidgets('MosaicButtons builds a grid with correct number of buttons and labels on phone', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    expect(find.byType(ElevatedButton), findsNWidgets(testData.length));

    for (final entry in testData) { // Verify the labels of the buttons
      expect(find.text(entry.key), findsOneWidget);
    }
  });

  testWidgets('MosaicButtons builds a grid with correct number of buttons and labels on tablet', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size((ScreenConfig.phoneScreen + 1).toDouble(), 800.0), testData, getMaterialPage);
    expect(find.byType(ElevatedButton), findsNWidgets(testData.length));

    for (final entry in testData) { // Verify the labels of the buttons
      expect(find.text(entry.key), findsOneWidget);
    }
  });

  testWidgets('MosaicButtons navigates to CardboardPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);

    await tester.tap(find.byKey(Key('Cardboard')));
    await tester.pumpAndSettle();
    expect(find.byType(CardboardPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to GlassPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.tap(find.byKey(Key('Glass')));
    await tester.pumpAndSettle();

    expect(find.byType(GlassPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to PlasticPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.tap(find.byKey(Key('Plastic')));
    await tester.pumpAndSettle();

    expect(find.byType(PlasticPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to ElectronicsPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.tap(find.byKey(Key('Electronics')));
    await tester.pumpAndSettle();

    expect(find.byType(ElectronicsPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to FlexiblePlasticsPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.ensureVisible(find.byKey(Key('Flexible Plastic')));
    await tester.tap(find.byKey(Key('Flexible Plastic')));
    await tester.pumpAndSettle();

    expect(find.byType(FlexiblePlasticsPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to MetalPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.ensureVisible(find.byKey(Key('Metal')));
    await tester.tap(find.byKey(Key('Metal')));
    await tester.pumpAndSettle();

    expect(find.byType(MetalPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to TextilesPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.ensureVisible(find.byKey(Key('Textiles')));
    await tester.tap(find.byKey(Key('Textiles')));
    await tester.pumpAndSettle();

    expect(find.byType(TextilesPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to WoodPage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.ensureVisible(find.byKey(Key('Wood')));
    await tester.tap(find.byKey(Key('Wood')));
    await tester.pumpAndSettle();

    expect(find.byType(WoodPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to FoodWastePage on button press', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    await tester.ensureVisible(find.byKey(Key('Food Waste')));
    await tester.tap(find.byKey(Key('Food Waste')));
    await tester.pumpAndSettle();

    expect(find.byType(FoodWastePage), findsOneWidget);
  });

  testWidgets('MosaicButtons handles empty labels list', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), [], getMaterialPage);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}

Future<void> pumpMosaicGridWidget(final WidgetTester tester, final Size size, final List<MapEntry<String, int>> labelIndexPairs, final GetPageCallback getPage) async {
  await tester.pumpWidget(MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: MosaicButtons.buildMosaicGrid(context, labelIndexPairs, getPage),
            ),
          );
        },
      ),
    ),
  ));
}
