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
  }) {
    _init(context);

    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: _isTablet ? 0.6 : 2,
      child: _buildTile(context, index, getPage, label, assetPath),
    );
  }

  static Widget wideIconTile({
    required BuildContext context,
    required int index,
    required GetPageCallback getPage,
    required String label,
    required String assetPath,
  }) {
    _init(context);
    return StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: _isTablet ? 0.6 : 2,
      child: _buildTile(context, index, getPage, label, assetPath),
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
      String assetPath,
      ) {
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
        child: Center(
          child: Semantics(
            label: label,
            child: Image.asset(
              assetPath,
              width: _imageSize,
              height: _imageSize,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}