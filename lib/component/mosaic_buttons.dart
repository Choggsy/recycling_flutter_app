import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton;
import '../helper/grid_helper.dart' show GridHelper;
import '../properties/device_view_vector.dart' show ScreenConfig, ViewType;

class MosaicButtons {
  static Widget buildMosaicGrid(final BuildContext context, final List labels, final Function getPage) {
    final ViewType viewType = ScreenConfig.getViewType(MediaQuery.of(context).size.width);

    return StaggeredGrid.count(
      crossAxisCount: viewType == ViewType.tablet ? 6 : 4, // More columns for tablets
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildMosaicButtons(labels, getPage, viewType),
    );
  }

  static List<Widget> _buildMosaicButtons(final List labels, final Function getPage, final ViewType viewType) {
    return labels.asMap().entries.map((entry) {
      final int index = entry.key;
      final int patternIndex = index % 5;

      return StaggeredGridTile.count(
        crossAxisCellCount: GridHelper.getCrossAxisCellCount(patternIndex),
        mainAxisCellCount: viewType == ViewType.tablet ? GridHelper.getMainAxisCellCount(patternIndex) / 1.5
            : GridHelper.getMainAxisCellCount(patternIndex),
        child: TileButton(
          label: entry.value,
          index: index,
          getPage: getPage,
        ),
      );
    }).toList();
  }
}