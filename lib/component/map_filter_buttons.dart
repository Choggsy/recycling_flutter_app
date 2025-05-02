import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart';

Widget buildFilterButton(final BuildContext context, final String filterCategory) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4.0),
    child: ElevatedButton(
      onPressed: () {
        //TODO: Add filtering logic (could)
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.darkBrown,
        backgroundColor: AppColors.background,
        minimumSize: Size(120, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: AppColors.darkBrown, width: 2),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        filterCategory,
        style: TextStyle(color: AppColors.darkBrown),
      ),
    ),
  );
}