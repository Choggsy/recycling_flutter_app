import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/model/news_story.dart';

void main() {
  group('NewsStory', () {
    void verifyNewsStory(
        final NewsStory story,
        final String expectedImageUrl,
        final String expectedTitle,
        final String expectedDescription,
        final String expectedFullArticleUrl,
        ) {
      expect(story.imageUrl, expectedImageUrl);
      expect(story.title, expectedTitle);
      expect(story.description, expectedDescription);
      expect(story.fullArticleUrl, expectedFullArticleUrl);
    }

    test('should create an instance with correct values', () {
      final story = NewsStory(
        imageUrl: 'https://example.com/image.jpg',
        title: 'Breaking News',
        description: 'Something important happened.',
        fullArticleUrl: 'https://example.com/full-article',
      );

      verifyNewsStory(
        story,
        'https://example.com/image.jpg',
        'Breaking News',
        'Something important happened.',
        'https://example.com/full-article',
      );
    });

    test('should create an instance from JSON', () {
      final json = {
        'imageUrl': 'https://example.com/image2.jpg',
        'title': 'Tech Update',
        'description': 'New tech released today.',
        'fullArticleUrl': 'https://example.com/tech-article',
      };

      verifyNewsStory(
        NewsStory.fromJson(json),
        'https://example.com/image2.jpg',
        'Tech Update',
        'New tech released today.',
        'https://example.com/tech-article',
      );
    });
  });
}