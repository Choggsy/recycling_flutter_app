import 'package:flutter_test/flutter_test.dart' show closeTo, expect, group, test;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;

void main() {
  final double delta = 0.1;

  group('Phones', () {
    test('ScreenConfig calculates for large phone screens', () {
      final double largeScreenWidth = 600.0;
      final double largeIconSize = ScreenConfig.getIconSize(largeScreenWidth);
      expect(
        largeIconSize,
        closeTo(largeScreenWidth * ScreenConfig.phoneIconSizeFactor, delta),
      );
    });

    test('ScreenConfig calculates for small phone screens', () {
      final double smallScreenWidth = 300.0;
      final double smallIconSize = ScreenConfig.getIconSize(smallScreenWidth);
      expect(
        smallIconSize,
        closeTo(smallScreenWidth * ScreenConfig.phoneIconSizeFactor, delta),
      );
    });

    test('ScreenConfig calculates small image size for phone screens', () {
      final double screenWidth = 400.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'small');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.phoneSmallImageFactor, delta),
      );
    });

    test('ScreenConfig calculates medium image size for phone screens', () {
      final double screenWidth = 400.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'medium');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.phoneMediumImageFactor, delta),
      );
    });

    test('ScreenConfig calculates large image size for phone screens', () {
      final double screenWidth = 400.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'large');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.phoneLargeImageFactor, delta),
      );
    });

    test('ScreenConfig calculates default image size for phone screens with invalid size', () {
      final double screenWidth = 400.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'invalid');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.phoneMediumImageFactor, delta),
      );
    });
  });

  group('Tablets', () {
    test('ScreenConfig calculates correct icon size for small tablet screens', () {
      final double tabletScreenWidth = 800.0;
      final double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);
      expect(
        tabletIconSize,
        closeTo(tabletScreenWidth * ScreenConfig.tabletIconSizeFactor, delta),
      );
    });

    test('ScreenConfig calculates correct icon size for large tablet screens', () {
      final double tabletScreenWidth = 1000.0;
      final double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);
      expect(
        tabletIconSize,
        closeTo(tabletScreenWidth * ScreenConfig.tabletIconSizeFactor, delta),
      );
    });

    test('ScreenConfig calculates small image size for tablet screens', () {
      final double screenWidth = 800.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'small');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.tabletSmallImageFactor, delta),
      );
    });

    test('ScreenConfig calculates medium image size for tablet screens', () {
      final double screenWidth = 800.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'medium');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.tabletMediumImageFactor, delta),
      );
    });

    test('ScreenConfig calculates large image size for tablet screens', () {
      final double screenWidth = 800.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'large');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.tabletLargeImageFactor, delta),
      );
    });

    test('ScreenConfig calculates default image size for tablet screens with invalid size', () {
      final double screenWidth = 800.0;
      final double imageSize = ScreenConfig.getImageSize(screenWidth, 'invalid');
      expect(
        imageSize,
        closeTo(screenWidth * ScreenConfig.tabletMediumImageFactor, delta),
      );
    });
  });
}