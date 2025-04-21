import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton;
import '../helper/grid_helper.dart' show GridHelper;

class MosaicButtons {
  static Widget buildMosaicGrid(final BuildContext context, final List labels, final Function getPage) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isTablet = screenSize.width > 600; // Adjust the threshold as needed

    return StaggeredGrid.count(
      crossAxisCount: isTablet ? 6 : 4, // More columns for tablets
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildMosaicButtons(labels, getPage, isTablet),
    );
  }

  static List<Widget> _buildMosaicButtons(final List labels, final Function getPage, final bool isTablet) {
    return labels.asMap().entries.map((entry) {
      final int index = entry.key;
      final String label = entry.value;
      final int patternIndex = index % 5;

      return StaggeredGridTile.count(
        crossAxisCellCount: GridHelper.getCrossAxisCellCount(patternIndex),
        mainAxisCellCount: isTablet ? GridHelper.getMainAxisCellCount(patternIndex) / 1.5 : GridHelper.getMainAxisCellCount(patternIndex),
        child: TileButton(
          label: label,
          index: index,
          getPage: getPage,
        ),
      );
    }).toList();
  }
}
