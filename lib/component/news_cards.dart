import 'package:flutter/material.dart';
import '../helper/space_helper.dart';
import '../view/homepage/subpages/article_page.dart';

class NewsStoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String fullArticleUrl;

  //testing classes
  final Widget Function(BuildContext)? pageBuilder;
  final ImageProvider? imageProvider;

  const NewsStoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.fullArticleUrl,
    this.pageBuilder,
    this.imageProvider,
  });

  String _truncateDescription(final String text, final int wordLimit) {
    final words = text.split(' ');
    if (words.length <= wordLimit) return text;
    return '${words.take(wordLimit).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) =>
                      pageBuilder?.call(context) ??
                      FullArticlePage(url: fullArticleUrl),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildClipRRect(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Space.medium.box,
                  Text(
                    _truncateDescription(description, 150),
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  Space.large.box,
                  const Text(
                    'Tap to read more',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect buildClipRRect() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
      child: Image(
        image: imageProvider ?? NetworkImage(imageUrl),
        width: double.infinity,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image, size: 100),
      ),
    );
  }
}
