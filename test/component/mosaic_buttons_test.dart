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
  const String testLabel = 'Recycle';

  Widget createTestWidget({
    required double width,
    required List<MapEntry<String, int>> labelIndexPairs,
    required GetPageCallback getPage,
  }) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Builder(
          builder: (context) => Scaffold(
            body: MosaicButtons.buildMosaicGrid(
              context,
              labelIndexPairs,
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
        MapEntry('Recycle', 0),
        MapEntry('Compost', 1),
        MapEntry('Reuse', 2),
      ];

      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        labelIndexPairs: entries,
        getPage: getPageStub,
      ));

      expect(find.byType(TileButton), findsNWidgets(entries.length));
    });

    testWidgets('TileButton receives correct label and index', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        labelIndexPairs: [MapEntry(testLabel, 42)],
        getPage: getPageStub,
      ));

      final tileButton = tester.widget<TileButton>(find.byType(TileButton));
      expect(tileButton.label, testLabel);
      expect(tileButton.index, 42);
    });

    testWidgets('uses correct layout for phone view', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: phoneWidth,
        labelIndexPairs: [MapEntry(testLabel, testIndex)],
        getPage: getPageStub,
      ));

      final tile = tester.widget<StaggeredGridTile>(find.byType(StaggeredGridTile));
      expect(tile.crossAxisCellCount, GridHelper.getCrossAxisCellCount(testIndex));
      expect(tile.mainAxisCellCount, GridHelper.getMainAxisCellCount(testIndex));
    });

    testWidgets('uses correct layout for tablet view', (tester) async {
      await tester.pumpWidget(createTestWidget(
        width: tabletWidth,
        labelIndexPairs: [MapEntry(testLabel, testIndex)],
        getPage: getPageStub,
      ));

      final tile = tester.widget<StaggeredGridTile>(find.byType(StaggeredGridTile));
      expect(tile.crossAxisCellCount, GridHelper.getCrossAxisCellCount(testIndex));
      expect(tile.mainAxisCellCount, closeTo(GridHelper.getMainAxisCellCount(testIndex) / 1.5, 0.01));
    });
  });
}