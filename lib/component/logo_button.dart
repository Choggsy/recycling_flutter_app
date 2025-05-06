import 'package:flutter/material.dart';
import '../helper/button_helper.dart' show TileButtonStyles;
import '../properties/app_theme.dart' show AppColors;

typedef GetPageCallback = Widget Function(int index);

class LogoButton extends StatelessWidget {
  final String label;
  final int index;
  final GetPageCallback getPage;
  final Color activeColor;

  const LogoButton({
    required this.label,
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
        key: Key(label),
        style: TileButtonStyles.buttonStyle(isActive, activeColor),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: Text(label),
      ),
    );
  }
}