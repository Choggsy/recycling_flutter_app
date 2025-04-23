import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/home_page.dart' show HomePage;
import 'package:recycling_flutter_app/view/upcycle_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('has a title and body text', (final WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.widgetWithText(CustomAppBar, 'Home'), findsOneWidget);

      expect(find.text('Home Page'), findsOneWidget);
    });

    group('navigation bar', () {
      testWidgets('navigates to UpcyclePage', (final WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: HomePage()));
        expect(find.byType(CustomBottomNavigationBar), findsOneWidget);

        await navigateOnBottomBarTo(tester, 'assets/navigation/reuse.png');
        expect(find.byType(UpcyclePage), findsOneWidget);
      });

      testWidgets('navigates to HomePage', (final WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: HomePage()));
        expect(find.byType(CustomBottomNavigationBar), findsOneWidget);

        await navigateOnBottomBarTo(tester, 'assets/navigation/home.png');
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('navigates to GuidelinesPage', (final WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: HomePage()));
        expect(find.byType(CustomBottomNavigationBar), findsOneWidget);

        await navigateOnBottomBarTo(tester, 'assets/navigation/guidelines.png');
        expect(find.byType(GuidelinesPage), findsOneWidget);
      });
    });
  });
}

Future<void> navigateOnBottomBarTo(final WidgetTester tester, final String path) async {
   await tester.tap(find.byWidgetPredicate((widget) {
    return widget is ImageIcon && widget.image is AssetImage && (widget.image as AssetImage).assetName == path;
  }));
  await tester.pumpAndSettle();
}
