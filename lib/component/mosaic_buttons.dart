import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../properties/app_theme.dart' show AppColors;

class MosaicButtons {
  static List<Widget> buildMosaicButtons(BuildContext context, List<String> labels, Function getPage) {
    List<Widget> buttons = [];
    for (int i = 0; i < labels.length; i++) {
      buttons.add(
        StaggeredGridTile.count(
          crossAxisCellCount: i == 4 ? 4 : (i == 0 ? 2 : 1),
          mainAxisCellCount: i == 0 ? 2 : 1,
          child: buildButton(context, labels[i], i, getPage),
        ),
      );
    }
    return buttons;
  }

  static Widget buildButton(BuildContext context, String label, int index, Function getPage) {
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
