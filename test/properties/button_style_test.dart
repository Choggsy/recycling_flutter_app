import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/properties/button_style.dart';

void main() {
  const String testLabel = 'Test Label';
  const String testAsset = 'assets/logo/placeholder.jpg';

  Widget mockPage(int index) => Scaffold(body: Text('Page $index'));

  Widget wrapInMaterial(Widget child) => MaterialApp(home: Scaffold(body: child));

  Widget buildPositionedTile({
    required String position,
    required bool showLabel,
    required String label,
  }) {
    return ButtonStyles.positioningConditions(
      position,
      showLabel,
      Text(label),
      Image.asset(testAsset),
    );
  }

  Future<void> pumpTile({
    required WidgetTester tester,
    required Widget Function(BuildContext) tileBuilder,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => StaggeredGrid.count(
            crossAxisCount: 4,
            children: [tileBuilder(context)],
          ),
        ),
      ),
    ));
  }

  group('ButtonStyles Widget Tests', () {
    testWidgets('iconTile renders with label and image', (tester) async {
      await pumpTile(
        tester: tester,
        tileBuilder: (context) => ButtonStyles.iconTile(
          context: context,
          index: 0,
          getPage: mockPage,
          label: testLabel,
          assetPath: testAsset,
        ),
      );

      expect(find.text(testLabel), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('wideIconTile renders with label and image', (tester) async {
      await pumpTile(
        tester: tester,
        tileBuilder: (context) => ButtonStyles.wideIconTile(
          context: context,
          index: 0,
          getPage: mockPage,
          label: testLabel,
          assetPath: testAsset,
        ),
      );

      expect(find.text(testLabel), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('tileContent renders and navigates on tap', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => ButtonStyles.tileContent(
            context: context,
            index: 2,
            getPage: mockPage,
            label: testLabel,
            assetPath: testAsset,
          ),
        ),
      ));

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.text('Page 2'), findsOneWidget);
    });

    testWidgets('buildTileButton renders and navigates on tap', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => ButtonStyles.buildTileButton('assets/logo/placeholder.jpg', 1, mockPage, context),
        ),
      ));

      await tester.tap(find.byType(TileButton));
      await tester.pumpAndSettle();

      expect(find.text('Page 1'), findsOneWidget);
    });
  });

  group('ButtonStyles Layout Logic', () {
    testWidgets('positioningConditions renders label on the left', (tester) async {
      await tester.pumpWidget(wrapInMaterial(
        buildPositionedTile(position: 'left', showLabel: true, label: 'Left Label'),
      ));

      expect(find.text('Left Label'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('positioningConditions defaults to right on invalid position', (tester) async {
      await tester.pumpWidget(wrapInMaterial(
        buildPositionedTile(position: 'invalid', showLabel: true, label: 'Fallback Label'),
      ));

      expect(find.text('Fallback Label'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('positioningConditions hides label when showLabel is false', (tester) async {
      await tester.pumpWidget(wrapInMaterial(
        buildPositionedTile(position: 'left', showLabel: false, label: 'Hidden Label'),
      ));

      expect(find.text('Hidden Label'), findsNothing);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}