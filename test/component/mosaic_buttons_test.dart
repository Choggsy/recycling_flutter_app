import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/mosaic_buttons.dart' show MosaicButtons;
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;
import 'package:recycling_flutter_app/view/guideline/material/cardboard_page.dart' show CardboardPage;
import 'package:recycling_flutter_app/view/guideline/material/glass_page.dart' show GlassPage;
import 'package:recycling_flutter_app/view/guideline/material/plastic_page.dart' show PlasticPage;

void main() {
  final List<String> testData = ['Cardboard', 'Glass', 'Plastic'];

  testWidgets('MosaicButtons builds a grid with correct number of buttons and labels on phone', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), testData, getMaterialPage);
    expect(find.byType(ElevatedButton), findsNWidgets(testData.length));

    for (final label in testData) { // Verify the labels of the buttons
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('MosaicButtons builds a grid with correct number of buttons and labels on tablet', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size((ScreenConfig.phoneScreen + 1).toDouble(), 800.0), testData, getMaterialPage);
    expect(find.byType(ElevatedButton), findsNWidgets(testData.length));

    for (final label in testData) { // Verify the labels of the buttons
      expect(find.text(label), findsOneWidget);
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

  testWidgets('MosaicButtons handles empty labels list', (final WidgetTester tester) async {
    await pumpMosaicGridWidget(tester, Size(ScreenConfig.phoneScreen.toDouble(), 800.0), [], getMaterialPage);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}

Future<void> pumpMosaicGridWidget(final WidgetTester tester,final Size size,final List<String> labels,final GetPageCallback getPage) async {
  await tester.pumpWidget(MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: MosaicButtons.buildMosaicGrid(context, labels, getPage),
          );
        },
      ),
    ),
  ));
}