import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recycling_flutter_app/component/logo_card.dart';

void main() {
  testWidgets('LogoCard displays image, title, and description', (tester) async {
    await mockNetworkImagesFor(() async {
      await buildCard(
        tester,
        'https://images.unsplash.com/photo-1587334274328-64186a80aeee',
        'Test Title',
        'Test Description',
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Icon), findsNothing);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });

  testWidgets('LogoCard shows error icon when image fails to load', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LogoCard(
            imageUrl: 'https://invalid.url/image.jpg',
            title: 'Error Title',
            description: 'Error Description',
            imageWidget: const Icon(Icons.broken_image, size: 48.0),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.broken_image), findsOneWidget);
    expect(find.text('Error Title'), findsOneWidget);
    expect(find.text('Error Description'), findsOneWidget);
  });
}

Future<void> buildCard(final WidgetTester tester, final String imageUrl, final String title, final String description) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: LogoCard(
          imageUrl: imageUrl,
          title: title,
          description: description,
        ),
      ),
    ),
  );
}