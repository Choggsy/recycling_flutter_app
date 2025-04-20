import 'package:flutter_test/flutter_test.dart' show closeTo, expect, test;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;

void main() {
  test('ScreenConfig calculates correct icon size for phone screens', () {
    double smallScreenWidth = 300.0;
    double largeScreenWidth = 600.0;

    double smallIconSize = ScreenConfig.getIconSize(smallScreenWidth);
    double largeIconSize = ScreenConfig.getIconSize(largeScreenWidth);

    expect(smallIconSize, closeTo(smallScreenWidth * ScreenConfig.phoneIconSizeFactor, 0.1));
    expect(largeIconSize, closeTo(largeScreenWidth * ScreenConfig.phoneIconSizeFactor, 0.1));
  });

  test('ScreenConfig calculates correct icon size for tablet screens', () {
    double tabletScreenWidth = 800.0;

    double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);

    expect(tabletIconSize, closeTo(tabletScreenWidth * ScreenConfig.tabletIconSizeFactor, 0.1));
  });
}
