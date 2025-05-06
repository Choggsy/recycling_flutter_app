import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/sustainable_page.dart';

void main() {
  group('SustainabilityPage Widget Tests', () {

    testWidgets('displays AppBar with correct title', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SustainabilityPage()));
      expect(find.text('Sustainability Page'), findsOneWidget);
    });

    testWidgets('displays back button icon', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SustainabilityPage()));
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('displays construction icon with correct properties', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SustainabilityPage()));
      final iconFinder = find.byIcon(Icons.construction);
      expect(iconFinder, findsOneWidget);

      final Icon icon = tester.widget(iconFinder);
      expect(icon.color, AppColors.green);
      expect(icon.size, 100);
    });

    testWidgets('displays main heading text', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SustainabilityPage()));
      expect(find.text("We're still building this page!"), findsOneWidget);
    });

    testWidgets('displays subheading text', (final WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SustainabilityPage()));
      expect(find.text('Check back soon for something awesome 🌱'), findsOneWidget);
    });
  });
}
