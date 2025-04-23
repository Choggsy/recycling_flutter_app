import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/logo_card.dart';

void main() {
  testWidgets('LogoCard displays image, title, and description', (final WidgetTester tester) async {
    await buildCard(tester, 'assets/logo.png', 'Test Title', 'Test Description');

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });

  testWidgets('LogoCard shows error icon when image fails to load', (final WidgetTester tester) async {
    await buildCard(tester, 'invalid_path', 'Error Title', 'Error Description');
    await tester.pumpAndSettle();

    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.image), findsOneWidget);
    expect(find.text('Error Title'), findsOneWidget);
    expect(find.text('Error Description'), findsOneWidget);
  });
}

Future<void> buildCard(final WidgetTester tester, final String imagePath, final String title, final String description) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: LogoCard(
          imagePath: imagePath,
          title: title,
          description: description,
        ),
      ),
    ),
  );
}