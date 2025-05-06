import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/mosaic_buttons.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/helper/grid_helper.dart';

void main() {
  const double phoneWidth = 400;
  const double tabletWidth = 900;
  const int testIndex = 4;
  const String testImagePath = 'assets/logo/placeholder.jpg';

  Widget createTestWidget({
    required double width,
    required List<MapEntry<String, int>> imageIndexPairs,
    required GetPageCallback getPage,
  }) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Builder(
          builder: (context) => Scaffold(
            body: MosaicButtons.buildMosaicGrid(
              context,
              imageIndexPairs,
              getPage,
            ),
          ),
        ),
      ),
    );
  }

  Widget getPageStub(int index) => Container();

  group('MosaicButtons Widget Tests', () {
    testWidgets('makes correct number of TileButtons', (tester) async {
      final entries = [
        MapEntry('assets/logo/placeholder.jpg', 0),
        MapEntry('assets/logo/placeholder.jpg', 1),
        MapEntry('assets/logo/placeholder.jpg', 2),
      ];

      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        imageIndexPairs: entries,
        getPage: getPageStub,
      ));

      expect(find.byType(TileButton), findsNWidgets(entries.length));
    });

    testWidgets('TileButton receives correct imagePath and index', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        imageIndexPairs: [MapEntry(testImagePath, 42)],
        getPage: getPageStub,
      ));

      final tileButton = tester.widget<TileButton>(find.byType(TileButton));
      expect(tileButton.imagePath, testImagePath);
      expect(tileButton.index, 42);
    });

    testWidgets('uses correct layout for phone view', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        imageIndexPairs: [MapEntry(testImagePath, testIndex)],
        getPage: getPageStub,
      ));

      final tile = tester.widget<StaggeredGridTile>(find.byType(StaggeredGridTile));
      expect(tile.crossAxisCellCount, GridHelper.getCrossAxisCellCount(testIndex));
      expect(tile.mainAxisCellCount, GridHelper.getMainAxisCellCount(testIndex));
    });

    testWidgets('uses correct layout for tablet view', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: tabletWidth,
        imageIndexPairs: [MapEntry(testImagePath, testIndex)],
        getPage: getPageStub,
      ));

      final tile = tester.widget<StaggeredGridTile>(find.byType(StaggeredGridTile));
      expect(tile.crossAxisCellCount, GridHelper.getCrossAxisCellCount(testIndex));
      expect(tile.mainAxisCellCount, closeTo(GridHelper.getMainAxisCellCount(testIndex) / 1.5, 0.01));
    });
  });
}