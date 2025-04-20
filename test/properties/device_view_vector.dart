import 'package:flutter_test/flutter_test.dart' show closeTo, expect, test;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;

void main() {
  final double pointOne = 0.1;

  test('ScreenConfig calculates correct icon size for phone screens', () {
    final double largeScreenWidth = 600.0;
    final double largeIconSize = ScreenConfig.getIconSize(largeScreenWidth);
    expect(largeIconSize, closeTo(largeScreenWidth * ScreenConfig.phoneIconSizeFactor, pointOne));
  });

  test('ScreenConfig calculates for small phone screens', () {
    final double smallScreenWidth = 300.0;
    final double smallIconSize = ScreenConfig.getIconSize(smallScreenWidth);
    expect(smallIconSize, closeTo(smallScreenWidth * ScreenConfig.phoneIconSizeFactor, pointOne));
  });


  test('ScreenConfig calculates correct icon size for small tablet screens', () {
    final double tabletScreenWidth = 800.0;
    final double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);

    expect(tabletIconSize, closeTo(tabletScreenWidth * ScreenConfig.tabletIconSizeFactor, pointOne));
  });

  test('ScreenConfig calculates correct icon size for large tablet screens', () {
    final double tabletScreenWidth = 1000.0;
    final double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);

    expect(tabletIconSize, closeTo(tabletScreenWidth * ScreenConfig.tabletIconSizeFactor, pointOne));
  });
}
