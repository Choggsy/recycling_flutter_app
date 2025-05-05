class NewsStory {
  final String imageUrl;
  final String title;
  final String description;
  final String fullArticleUrl;

  NewsStory({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.fullArticleUrl,
  });

  factory NewsStory.fromJson(Map<String, dynamic> json) {
    return NewsStory(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      fullArticleUrl: json['fullArticleUrl'],
    );
  }
}