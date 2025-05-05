import 'package:flutter/material.dart';

import '../view/homepage/subpages/article_page.dart';

class NewsStoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String fullArticleUrl;

  const NewsStoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.fullArticleUrl,
  });

  String _truncateDescription(final String text, final int wordLimit) {
    final words = text.split(' ');
    if (words.length <= wordLimit) return text;
    return words.take(wordLimit).join(' ') + '...';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FullArticlePage(url: fullArticleUrl),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 8.0),
                  Text(
                    _truncateDescription(description, 150),
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 8.0),
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
}