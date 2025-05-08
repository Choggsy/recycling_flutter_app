import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart';
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/homepage/home_page.dart';
import 'package:recycling_flutter_app/model/fact.dart';
import 'package:recycling_flutter_app/view/upcycle/upcycle_page.dart';

import '../guideline/guidelines_page_test.dart';

void main() {
  group('HomePage navigation bar', () {
    testWidgets('navigates to UpcyclePage', (final WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(CustomBottomNavigationBar), findsOneWidget);

      await navigateOnBottomBarTo(tester, 'assets/navigation/reuse.png');
      expect(find.byType(UpcyclePage), findsOneWidget);
    });

    testWidgets('navigates to GuidelinesPage', (final WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(CustomBottomNavigationBar), findsOneWidget);

      await navigateOnBottomBarTo(tester, 'assets/navigation/guidelines.png');
      expect(find.byType(GuidelinesPage), findsOneWidget);
    });
  });
}

MaterialApp buildPage(final List<RecyclingFact> mockFacts) {
  return MaterialApp(
      home: FutureBuilder<List<RecyclingFact>>(
        future: Future.value(mockFacts),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return const HomePage();
        },
      ),
    );
}