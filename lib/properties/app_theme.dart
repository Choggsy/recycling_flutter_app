// app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color greenish = Color(0xFFB5CA8D); // Greenish
  static const Color green = Color(0xFF8BB174); // Green
  static const Color background = Colors.white; // White surface
  static const Color darkBlue = Color(0xFF222E50); // Dark Blue
  static const Color darkGreen = Color(0xFF2A4849); // Dark Green
  static const Color darkBrown = Color(0xFF4E342E); // Dark Brown
  static const Color darkRedBrown = Color(0xFF2b0e12); // Dark Red-ish Brown
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme(
        primary: AppColors.greenish,
        secondary: AppColors.green,
        surface: AppColors.background,
        error: AppColors.darkBlue,
        onPrimary: AppColors.darkGreen,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.red,
        brightness: Brightness.light,
      ),
      hintColor: AppColors.darkBrown,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkRedBrown),
        bodyMedium: TextStyle(color: AppColors.darkBrown),
        displayMedium: TextStyle(
          color: AppColors.darkGreen,
          fontSize: 24.0, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.greenish,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.darkBrown),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.green,
        selectedItemColor: AppColors.darkRedBrown,
        unselectedItemColor: AppColors.darkBrown,
      ),
    );
  }
}

