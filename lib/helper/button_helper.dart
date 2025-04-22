import 'package:flutter/material.dart';
import '../properties/app_theme.dart' show AppColors;

class TileButtonStyles {
  static BoxDecoration containerDecoration(bool isActive, Color activeColor) {
    return BoxDecoration(
      border: Border.all(color: AppColors.darkBrown, width: 3.0),
      color: isActive ? activeColor : AppColors.background,
    );
  }

  static ButtonStyle buttonStyle(bool isActive, Color activeColor) {
    return ElevatedButton.styleFrom(
      foregroundColor: isActive ? AppColors.background : AppColors.darkBrown,
      backgroundColor: isActive ? activeColor : AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    );
  }
}
