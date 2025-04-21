import 'package:flutter/material.dart';
import '../properties/app_theme.dart' show AppColors;

class TileButton extends StatelessWidget {
  final String label;
  final int index;
  final Function getPage;

  const TileButton({
    required this.label,
    required this.index,
    required this.getPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBrown, width: 3.0),
        color: AppColors.background, // Use theme color
      ),
      child: ElevatedButton(
        key: Key(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.darkBrown,
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: Text(label), // TODO : Replace with actual button labels
      ),
    );
  }
}