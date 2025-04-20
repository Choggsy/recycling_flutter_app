import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/layout_widgets/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;

void main() {
  testWidgets('CustomBottomNavigationBar has all buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    ));

    // Verify the presence of each button
    expect(find.byType(ImageIcon).at(0), findsOneWidget);
    expect(find.byType(ImageIcon).at(1), findsOneWidget);
    expect(find.byType(ImageIcon).at(2), findsOneWidget);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with small phone screen size', (WidgetTester tester) async {
    double smallScreenWidth = 300.0;

    // Test with small phone screen size
    await tester.binding.setSurfaceSize(Size(smallScreenWidth, 600));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    ));
    double smallIconSize = ScreenConfig.getIconSize(smallScreenWidth);
    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(tester.widget<SizedBox>(find.byType(SizedBox).first).width, closeTo(smallIconSize, 1.0));

    // Reset screen size
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with large phone screen size', (WidgetTester tester) async {
    double largeScreenWidth = 600.0;

    // Test with large phone screen size
    await tester.binding.setSurfaceSize(Size(largeScreenWidth, 600));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    ));
    double largeIconSize = ScreenConfig.getIconSize(largeScreenWidth);
    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(tester.widget<SizedBox>(find.byType(SizedBox).first).width, closeTo(largeIconSize, 1.0));

    // Reset screen size
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with tablet screen size', (WidgetTester tester) async {
    double tabletScreenWidth = 800.0;

    // Test with tablet screen size
    await tester.binding.setSurfaceSize(Size(tabletScreenWidth, 600));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    ));
    double tabletIconSize = ScreenConfig.getIconSize(tabletScreenWidth);
    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(tester.widget<SizedBox>(find.byType(SizedBox).first).width, closeTo(tabletIconSize, 1.0));

    // Reset screen size
    await tester.binding.setSurfaceSize(null);
  });
}
