import 'package:flutter/material.dart';
import '../../../component/news_cards.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: const [ //TODO : after concept proves implement as json file also update to use web photo
          NewsStoryCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'Workplace Recycling in England is changing',
            description: 'From April 2025, all businesses and non-domestic premises in England with more than 10 full time equivalent staff will be required to separate their dry recyclable and food waste from residual waste as part of the Government’s Simpler Recycling legislation.',
            fullArticleUrl: 'https://www.recyclenow.com/news-and-campaigns/workplace-recycling-in-england',
          ),
          NewsStoryCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: '20 years of recycling progress',
            description: 'You may not realise it, but over the last 20 years, you’ve been part of a Recycling movement! 2023 is the 20th year of Recycle Week, so what better time to look back on the progress we’ve made together and what we’d like to see in the future? Let’s take a walk through two decades of recycling history and see how far we’ve come…',
            fullArticleUrl: 'https://www.recyclenow.com/news-and-campaigns/recycling-progress',
          )
        ],
      ),
    );
  }
}