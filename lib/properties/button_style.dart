import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../properties/app_theme.dart';
import '../../properties/device_view_vector.dart';
import '../component/tile_button.dart';

typedef GetPageCallback = Widget Function(int index);

class ButtonStyles {
  static late double _screenWidth;
  static late bool _isTablet;
  static late double _imageSize;

  static void _init(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _isTablet = ScreenConfig.getViewType(_screenWidth) == ViewType.tablet;
    _imageSize = ScreenConfig.getImageSize(_screenWidth, 'large');
  }

  static Widget iconTile({
    required BuildContext context,
    required int index,
    required GetPageCallback getPage,
    required String label,
    required String assetPath,
    bool showLabel = true,
    String textPosition = 'right',
  }) {
    _init(context);

    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: _isTablet ? 0.6 : 2,
      child: _buildTile(
        context,
        index,
        getPage,
        label,
        assetPath,
        showLabel: showLabel,
        textPosition: textPosition,
      ),
    );
  }

  static Widget wideIconTile({
    required BuildContext context,
    required int index,
    required GetPageCallback getPage,
    required String label,
    required String assetPath,
    bool showLabel = true,
    String textPosition = 'right',
  }) {
    _init(context);
    return StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: _isTablet ? 0.6 : 2,
      child: _buildTile(
        context,
        index,
        getPage,
        label,
        assetPath,
        showLabel: showLabel,
        textPosition: textPosition,
      ),
    );
  }


  static Widget buildTileButton(
      String label,
      int index,
      GetPageCallback getPage,
      BuildContext context,
      ) {
    _init(context);
    return SizedBox(
      width: double.infinity,
      height: _isTablet ? 150.0 : 110.0,
      child: TileButton(
        label: label,
        index: index,
        getPage: getPage,
      ),
    );
  }

  static Widget _buildTile(
      BuildContext context,
      int index,
      GetPageCallback getPage,
      String label,
      String assetPath, {
        bool showLabel = true,
        String textPosition = 'right',
      }) {

    Widget content = positioningConditions(
        textPosition,
        showLabel,
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        Image.asset(assetPath, width: _imageSize, height: _imageSize, fit: BoxFit.contain));

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => getPage(index)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkBrown, width: 3.0),
          color: AppColors.background,
        ),
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
  }

  static Widget positioningConditions(String textPosition, bool showLabel, Text text, Image image) {
     Widget content;

    if (textPosition == 'left') {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showLabel) Expanded(child: text),
          image,
        ],
      );
    } else if (textPosition == 'right') {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          if (showLabel) Expanded(child: text),
        ],
      );
    } else {
      // Fallback to right if invalid value is passed
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          if (showLabel) Expanded(child: text),
        ],
      );
    }
    return content;
  }
}