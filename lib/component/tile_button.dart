import 'package:flutter/material.dart';
import '../helper/button_helper.dart' show TileButtonStyles;
import '../properties/app_theme.dart' show AppColors;

typedef GetPageCallback = Widget Function(int index);

class TileButton extends StatelessWidget {
  final String imagePath;
  final int index;
  final GetPageCallback getPage;
  final Color activeColor;

  const TileButton({
    required this.imagePath,
    required this.index,
    required this.getPage,
    this.activeColor = AppColors.background,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = activeColor != AppColors.background;

    return Container(
      decoration: TileButtonStyles.containerDecoration(isActive, activeColor),
      child: ElevatedButton(
        style: TileButtonStyles.buttonStyle(isActive, activeColor),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),

      ),
    );
  }
}