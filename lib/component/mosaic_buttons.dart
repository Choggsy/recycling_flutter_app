import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton;
import '../helper/grid_helper.dart' show GridHelper;

class MosaicButtons {
  static Widget buildMosaicGrid(final BuildContext context, final List<String> labels, final Function getPage) {
    return StaggeredGrid.count(
      crossAxisCount: 4, // Number of columns in the grid
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildMosaicButtons(labels, getPage),
    );
  }

  static List<Widget> _buildMosaicButtons(final List<String> labels, final Function getPage) {
    List<Widget> buttons = [];

    for (int i = 0; i < labels.length; i++) {
      final int patternIndex = i % 5;
      buttons.add(
        StaggeredGridTile.count(
          crossAxisCellCount: GridHelper.getCrossAxisCellCount(patternIndex),
          mainAxisCellCount: GridHelper.getMainAxisCellCount(patternIndex),
          child: TileButton(
            label: labels[i],
            index: i,
            getPage: getPage,
          ),
        ),
      );
    }
    return buttons;
  }
}
