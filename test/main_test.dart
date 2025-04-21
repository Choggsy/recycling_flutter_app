import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/main.dart';
import 'package:recycling_flutter_app/view/home_page.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart';

void main() {
  testWidgets('Verify the home page is displayed', (final WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('Compare specific properties of the theme', (final WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final ThemeData theme = Theme.of(tester.element(find.byType(HomePage)));

    expect(theme.primaryColor, equals(AppTheme.lightTheme.primaryColor));
    expect(theme.colorScheme.surface, equals(AppTheme.lightTheme.colorScheme.surface));
  });

  testWidgets('Verify the MaterialApp widget is present', (final WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
