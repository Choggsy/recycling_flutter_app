import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/properties/device_view_vector.dart' show ScreenConfig;

final double delta = 1.0;
final int indexZero = 0;

void main() {
  testWidgets('CustomBottomNavigationBar has all buttons', (WidgetTester tester) async {
    await mockApp(tester, indexZero);

    // Verify the presence of each button
    expect(find.byType(ImageIcon).at(indexZero), findsOneWidget);
    expect(find.byType(ImageIcon).at(1), findsOneWidget);
    expect(find.byType(ImageIcon).at(2), findsOneWidget);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with small phone screen size', (WidgetTester tester) async {
    final double smallScreenWidth = 300.0;

    physicalDimensions(tester, smallScreenWidth);
    await mockApp(tester, indexZero);

    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(tester.widget<SizedBox>(find.byType(SizedBox).first).width,
      closeTo(ScreenConfig.getIconSize(smallScreenWidth), delta),);

    resetScreenSize(tester);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with large phone screen size', (WidgetTester tester) async {
    final double largeScreenWidth = 600.0;
    physicalDimensions(tester, largeScreenWidth);

    await mockApp(tester, indexZero);

    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(
      tester.widget<SizedBox>(find.byType(SizedBox).first).width,
      closeTo(ScreenConfig.getIconSize(largeScreenWidth), delta),
    );

    resetScreenSize(tester);
  });

  testWidgets('CustomBottomNavigationBar icon size changes with tablet screen size', (WidgetTester tester) async {
    final double tabletScreenWidth = 800.0;
    physicalDimensions(tester, tabletScreenWidth);
    await mockApp(tester, indexZero);

    expect(find.byType(SizedBox).first, findsOneWidget);
    expect(
      tester.widget<SizedBox>(find.byType(SizedBox).first).width,
      closeTo(ScreenConfig.getIconSize(tabletScreenWidth), delta),
    );

    resetScreenSize(tester);
  });

  testWidgets('CustomBottomNavigationBar onTap callback is called', (WidgetTester tester) async {
    int tappedIndex = -1;

    await mockApp(tester, indexZero, (index) {
      tappedIndex = index;
    });

    // Tap on the second item
    await tester.tap(find.byType(ImageIcon).at(1));
    await tester.pump();

    // Verify that the onTap callback is called with the correct index
    expect(tappedIndex, 1);
  });

  testWidgets('CustomBottomNavigationBar updates currentIndex', (WidgetTester tester) async {
    await mockApp(tester, 1);

    // Verify that the second item is selected
    BottomNavigationBar bottomNavigationBar = tester.widget(find.byType(BottomNavigationBar));
    expect(bottomNavigationBar.currentIndex, 1);
  });
}

void resetScreenSize(final WidgetTester tester) {
  tester.view.resetPhysicalSize();
  tester.view.resetDevicePixelRatio();
}

void physicalDimensions(final WidgetTester tester, final double screenWidth) {
  tester.view.devicePixelRatio = delta;
  tester.view.physicalSize = Size(screenWidth, 600);
}

Future<void> mockApp(final WidgetTester tester, final int currentIndex, [Function(int)? onTap]) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap ?? (index) {},
        ),
      ),
    ),
  );
}
