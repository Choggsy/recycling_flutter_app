import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../component/news_cards.dart';
import '../../../model/news_story.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<NewsStory>> _newsStories;

  Future<List<NewsStory>> loadNewsStories() async {
    final List<dynamic> jsonList = json.decode(await rootBundle.loadString('assets/news_stories.json'));
    return jsonList.map((json) => NewsStory.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    _newsStories = loadNewsStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<NewsStory>>(
        future: _newsStories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news stories available.'));
          }

          final stories = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: stories.length,
            itemBuilder: (context, index) {
              final story = stories[index];
              return NewsStoryCard(
                imagePath: story.imagePath,
                title: story.title,
                description: story.description,
                fullArticleUrl: story.fullArticleUrl,
              );
            },
          );
        },
      ),
    );
  }
}
