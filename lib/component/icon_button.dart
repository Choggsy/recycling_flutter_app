import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';

import '../properties/app_theme.dart';

class IconTileButton extends StatelessWidget {
  final int index;
  final GetPageCallback getPage;
  final String assetPath;
  final String semanticLabel;
  final Color backgroundColor;

  const IconTileButton({
    required this.index,
    required this.getPage,
    required this.assetPath,
    required this.semanticLabel,
    this.backgroundColor = AppColors.background,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          color: backgroundColor,
        ),
        child: Center(
          child: Semantics(
            label: semanticLabel,
            child: Image.asset(
              assetPath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
