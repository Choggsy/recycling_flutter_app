import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart' show AppColors, AppTheme;

void main() {
  group('AppColors', () {
    test('greenish color is correct', () {
      expect(AppColors.greenish, equals(Color(0xFFB5CA8D)));
    });

    test('green color is correct', () {
      expect(AppColors.green, equals(Color(0xFF8BB174)));
    });

    test('background color is correct', () {
      expect(AppColors.background, equals(Colors.white));
    });

    test('darkBlue color is correct', () {
      expect(AppColors.darkBlue, equals(Color(0xFF222E50)));
    });

    test('darkGreen color is correct', () {
      expect(AppColors.darkGreen, equals(Color(0xFF2A4849)));
    });

    test('darkBrown color is correct', () {
      expect(AppColors.darkBrown, equals(Color(0xFF4E342E)));
    });

    test('darkRedBrown color is correct', () {
      expect(AppColors.darkRedBrown, equals(Color(0xFF2b0e12)));
    });
  });

  group('AppTheme', () {
    test('lightTheme has correct primary color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.colorScheme.primary, equals(AppColors.greenish));
    });

    test('lightTheme has correct secondary color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.colorScheme.secondary, equals(AppColors.green));
    });

    test('lightTheme has correct surface color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.colorScheme.surface, equals(AppColors.background));
    });

    test('lightTheme has correct error color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.colorScheme.error, equals(AppColors.darkBlue));
    });

    test('lightTheme has correct onPrimary color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.colorScheme.onPrimary, equals(AppColors.darkGreen));
    });

    test('lightTheme has correct hint color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.hintColor, equals(AppColors.darkBrown));
    });

    test('lightTheme has correct textTheme bodyLarge color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.textTheme.bodyLarge?.color, equals(AppColors.darkRedBrown));
    });

    test('lightTheme has correct textTheme bodyMedium color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.textTheme.bodyMedium?.color, equals(AppColors.darkBrown));
    });

    test('lightTheme has correct appBarTheme color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.appBarTheme.backgroundColor, equals(AppColors.greenish));
    });

    test('lightTheme has correct bottomNavigationBarTheme background color', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.bottomNavigationBarTheme.backgroundColor, equals(AppColors.green));
    });

    test('lightTheme has correct bottomNavigationBarTheme selectedItemColor', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.bottomNavigationBarTheme.selectedItemColor, equals(AppColors.darkRedBrown));
    });

    test('lightTheme has correct bottomNavigationBarTheme unselectedItemColor', () {
      final ThemeData theme = AppTheme.lightTheme;
      expect(theme.bottomNavigationBarTheme.unselectedItemColor, equals(AppColors.darkBrown));
    });
  });
}
