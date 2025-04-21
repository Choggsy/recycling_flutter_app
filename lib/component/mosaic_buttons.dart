import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../properties/app_theme.dart' show AppColors;
import '../helper/grid_helper.dart' show GridHelper;

class MosaicButtons {
  static Widget buildMosaicGrid(final BuildContext context, final List<String> labels, final Function getPage) {
    return StaggeredGrid.count(
      crossAxisCount: 4, // Number of columns in the grid
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildMosaicButtons(context, labels, getPage),
    );
  }

  static List<Widget> _buildMosaicButtons(final BuildContext context, final List<String> labels, final Function getPage) {
    List<Widget> buttons = [];

    for (int i = 0; i < labels.length; i++) {
      final int patternIndex = i % 5;
      buttons.add(
        StaggeredGridTile.count(
          crossAxisCellCount: GridHelper.getCrossAxisCellCount(patternIndex),
          mainAxisCellCount: GridHelper.getMainAxisCellCount(patternIndex),
          child: _buildButton(context, labels[i], i, getPage),
        ),
      );
    }
    return buttons;
  }

  static Widget _buildButton(final BuildContext context, final String label, final int index, final Function getPage) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBrown, width: 3.0), // Thick border
        color: AppColors.background, // Use theme color
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.darkBrown, backgroundColor: AppColors.background, // Text color from theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        onPressed: () {
          // Navigate to different material pages using getPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: Text(label), // Replace with actual button labels
      ),
    );
  }
}
