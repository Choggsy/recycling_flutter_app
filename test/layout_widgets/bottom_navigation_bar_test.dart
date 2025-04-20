import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/layout_widgets/bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/properties/device_view_vector.dart'
    show ScreenConfig;

final double delta = 1.0;

void main() {
  testWidgets('CustomBottomNavigationBar has all buttons', (
    WidgetTester tester,
  ) async {
    await mockApp(tester);

    // Verify the presence of each button
    expect(find.byType(ImageIcon).at(0), findsOneWidget);
    expect(find.byType(ImageIcon).at(1), findsOneWidget);
    expect(find.byType(ImageIcon).at(2), findsOneWidget);
  });

  testWidgets(
    'CustomBottomNavigationBar icon size changes with small phone screen size',
    (WidgetTester tester) async {
      final double smallScreenWidth = 300.0;
      physicalDimensions(tester, smallScreenWidth);
      await mockApp(tester);

      expect(find.byType(SizedBox).first, findsOneWidget);
      expect(
        tester.widget<SizedBox>(find.byType(SizedBox).first).width,
        closeTo(ScreenConfig.getIconSize(smallScreenWidth), delta),
      );

      resetScreenSize(tester);
    },
  );

  testWidgets(
    'CustomBottomNavigationBar icon size changes with large phone screen size',
    (WidgetTester tester) async {
      final double largeScreenWidth = 600.0;
      physicalDimensions(tester, largeScreenWidth);
      await mockApp(tester);

      expect(find.byType(SizedBox).first, findsOneWidget);
      expect(
        tester.widget<SizedBox>(find.byType(SizedBox).first).width,
        closeTo(ScreenConfig.getIconSize(largeScreenWidth), delta),
      );

      resetScreenSize(tester);
    },
  );

  testWidgets(
    'CustomBottomNavigationBar icon size changes with tablet screen size',
    (WidgetTester tester) async {
      final double tabletScreenWidth = 800.0;
      physicalDimensions(tester, tabletScreenWidth);
      await mockApp(tester);

      expect(find.byType(SizedBox).first, findsOneWidget);
      expect(
        tester.widget<SizedBox>(find.byType(SizedBox).first).width,
        closeTo(ScreenConfig.getIconSize(tabletScreenWidth), delta),
      );

      resetScreenSize(tester);
    },
  );
}

void resetScreenSize(final WidgetTester tester) {
  tester.view.resetPhysicalSize();
  tester.view.resetDevicePixelRatio();
}

void physicalDimensions(
  final WidgetTester tester,
  final double smallScreenWidth,
) {
  tester.view.devicePixelRatio = delta;
  tester.view.physicalSize = Size(smallScreenWidth, 600);
}

Future<void> mockApp(final WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    ),
  );
}
