import 'package:flutter/material.dart';

enum ViewType { phone, tablet }

class ScreenConfig {
  static const int phoneScreen = 600;

  static const double phoneIconSizeFactor = 0.08;
  static const double tabletIconSizeFactor = 0.029;

  static const double tabletSmallImageFactor = 0.15;
  static const double tabletMediumImageFactor = 0.2;
  static const double tabletLargeImageFactor = 0.25;

  static const double phoneSmallImageFactor = 0.1;
  static const double phoneMediumImageFactor = 0.2;
  static const double phoneLargeImageFactor = 0.3;

  static ViewType getViewType(double screenWidth) {
    return screenWidth <= phoneScreen ? ViewType.phone : ViewType.tablet;
  }

  static double getIconSize(double screenWidth) {
    return getViewType(screenWidth) == ViewType.phone
        ? screenWidth * phoneIconSizeFactor
        : screenWidth * tabletIconSizeFactor;
  }

  static double getImageSize(double screenWidth, String size) {
    switch (getViewType(screenWidth)) {
      case ViewType.phone:
        switch (size) {
          case 'small':
            return screenWidth * phoneSmallImageFactor;
          case 'medium':
            return screenWidth * phoneMediumImageFactor;
          case 'large':
            return screenWidth * phoneLargeImageFactor;
          default:
            return screenWidth * phoneMediumImageFactor; // Default to medium
        }

      case ViewType.tablet:
        switch (size) {
          case 'small':
            return screenWidth * tabletSmallImageFactor;
          case 'medium':
            return screenWidth * tabletMediumImageFactor;
          case 'large':
            return screenWidth * tabletLargeImageFactor;
          default:
            return screenWidth * tabletMediumImageFactor; // Default to medium
        }
    }
  }
}
