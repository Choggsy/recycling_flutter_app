import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/properties/button_style.dart';

void main() {
  const String testLabel = 'Test Label';
  const String testAsset = 'assets/logo/placeholder.jpg';

  Widget mockPage(int index) => Scaffold(body: Text('Page $index'));

  Widget createTestWidget(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  Future<void> pumpIconTile(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return StaggeredGrid.count(
              crossAxisCount: 4,
              children: [
                ButtonStyles.iconTile(
                  context: context,
                  index: 0,
                  getPage: mockPage,
                  label: testLabel,
                  assetPath: testAsset,
                ),
              ],
            );
          },
        ),
      ),
    ));
  }

  group('ButtonStyles Tests', () {
    testWidgets('iconTile renders with label and image', (tester) async {
      await pumpIconTile(tester);

      expect(find.text(testLabel), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('tileContent navigates to correct page on tap', (tester) async {
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
          builder: (context) => ButtonStyles.buildTileButton('Test Button', 1, mockPage, context),
        ),
      ));

      expect(find.text('Test Button'), findsOneWidget);
      await tester.tap(find.byType(TileButton));
      await tester.pumpAndSettle();

      expect(find.text('Page 1'), findsOneWidget);
    });

    testWidgets('positioningConditions renders label on the left', (tester) async {
      await tester.pumpWidget(createTestWidget(
        ButtonStyles.positioningConditions(
          'left',
          true,
          const Text('Label'),
          Image.asset(testAsset),
        ),
      ));

      expect(find.text('Label'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('positioningConditions defaults to right on invalid position', (tester) async {
      await tester.pumpWidget(createTestWidget(
        ButtonStyles.positioningConditions(
          'invalid',
          true,
          const Text('Fallback Label'),
          Image.asset(testAsset),
        ),
      ));

      expect(find.text('Fallback Label'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('tileContent renders correctly', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => ButtonStyles.tileContent(
            context: context,
            index: 0,
            getPage: mockPage,
            label: testLabel,
            assetPath: testAsset,
          ),
        ),
      ));

      expect(find.text(testLabel), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('wideIconTile renders with correct layout', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => StaggeredGrid.count(
              crossAxisCount: 4,
              children: [
                ButtonStyles.wideIconTile(
                  context: context,
                  index: 0,
                  getPage: mockPage,
                  label: testLabel,
                  assetPath: testAsset,
                ),
              ],
            ),
          ),
        ),
      ));

      expect(find.text(testLabel), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

  });

  group('Edge & Optional Tests', (){
    testWidgets('positioningConditions hides label when showLabel is false', (tester) async {
      await tester.pumpWidget(createTestWidget(
        ButtonStyles.positioningConditions(
          'left',
          false,
          const Text('Hidden Label'),
          Image.asset(testAsset),
        ),
      ));

      expect(find.text('Hidden Label'), findsNothing);
      expect(find.byType(Image), findsOneWidget);
    });

  });
}
