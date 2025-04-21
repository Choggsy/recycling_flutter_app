import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/mosaic_buttons.dart' show MosaicButtons;
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/view/material/cardboard_page.dart';
import 'package:recycling_flutter_app/view/material/glass_page.dart';
import 'package:recycling_flutter_app/view/material/plastic_page.dart';

void main() {
  testWidgets('MosaicButtons builds a grid with correct number of buttons and labels', (WidgetTester tester) async {
    // Define test data
    final List<String> labels = ['Cardboard', 'Glass', 'Plastic'];
    final Function getPage = getMaterialPage;

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: MosaicButtons.buildMosaicGrid(context, labels, getPage),
          );
        },
      ),
    ));

    // Verify the number of buttons
    expect(find.byType(ElevatedButton), findsNWidgets(labels.length));

    // Verify the labels of the buttons
    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('MosaicButtons navigates to CardboardPage on button press', (WidgetTester tester) async {
    // Define test data
    final List<String> labels = ['Cardboard', 'Glass', 'Plastic'];
    final Function getPage = getMaterialPage;

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: MosaicButtons.buildMosaicGrid(context, labels, getPage),
          );
        },
      ),
    ));

    // Tap the first button
    await tester.tap(find.byKey(Key('Cardboard')));
    await tester.pumpAndSettle();

    // Verify navigation to the correct page
    expect(find.byType(CardboardPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to GlassPage on button press', (WidgetTester tester) async {
    // Define test data
    final List<String> labels = ['Cardboard', 'Glass', 'Plastic'];
    final Function getPage = getMaterialPage;

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: MosaicButtons.buildMosaicGrid(context, labels, getPage),
          );
        },
      ),
    ));

    // Tap the second button
    await tester.tap(find.byKey(Key('Glass')));
    await tester.pumpAndSettle();

    // Verify navigation to the correct page
    expect(find.byType(GlassPage), findsOneWidget);
  });

  testWidgets('MosaicButtons navigates to PlasticPage on button press', (WidgetTester tester) async {
    // Define test data
    final List<String> labels = ['Cardboard', 'Glass', 'Plastic'];
    final Function getPage = getMaterialPage;

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: MosaicButtons.buildMosaicGrid(context, labels, getPage),
          );
        },
      ),
    ));

    // Tap the third button
    await tester.tap(find.byKey(Key('Plastic')));
    await tester.pumpAndSettle();

    // Verify navigation to the correct page
    expect(find.byType(PlasticPage), findsOneWidget);
  });
}
