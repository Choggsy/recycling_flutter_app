import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/news_cards.dart';

class MockFullArticlePage extends StatelessWidget {
  final String url;

  const MockFullArticlePage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Mock Full Article Page'),
    );
  }
}

void main() {
  const testImageUrl = 'https://example.com/image.jpg';
  const testTitle = 'Test News Title';
  const testDescription = 'This is a test description with many words to test truncation logic.';
  const testFullArticleUrl = 'https://example.com/full-article';

  Widget createTestWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  testWidgets('renders title, truncated description, and prompt text', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(
      child: const NewsStoryCard(
        imageUrl: testImageUrl,
        title: testTitle,
        description: testDescription,
        fullArticleUrl: testFullArticleUrl,
      ),
    ));

    expect(find.text(testTitle), findsOneWidget);
    expect(find.textContaining('This is a test description'), findsOneWidget);
    expect(find.text('Tap to read more'), findsOneWidget);
  });

  testWidgets('navigates to FullArticlePage on tap', (final WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: NewsStoryCard(
        imageUrl: testImageUrl,
        title: testTitle,
        description: testDescription,
        fullArticleUrl: testFullArticleUrl,
        pageBuilder: (_) => const MockFullArticlePage(url: testFullArticleUrl),
        imageProvider: MemoryImage(Uint8List.fromList(buildMockImageOfMemory())),
      ),
    ));

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.text('Mock Full Article Page'), findsOneWidget);
  });

  testWidgets('shows fallback icon when image fails to load', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(
      child: const NewsStoryCard(
        imageUrl: 'https://invalid-url.com/image.jpg',
        title: testTitle,
        description: testDescription,
        fullArticleUrl: testFullArticleUrl,
      ),
    ));

    final fallback = tester.widget<Image>(find.byType(Image)).errorBuilder!(
      tester.element(find.byType(Image)),
      Object(),
      StackTrace.current,
    );

    expect(fallback, isA<Icon>());
    expect((fallback as Icon).icon, Icons.broken_image);
  });
}

List<int> buildMockImageOfMemory() {
  return [
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
    0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
    0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
    0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
    0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
    0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
    0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00,
    0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
    0x42, 0x60, 0x82,];
}