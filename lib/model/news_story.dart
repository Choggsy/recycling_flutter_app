class NewsStory {
  final String imagePath;
  final String title;
  final String description;
  final String fullArticleUrl;

  NewsStory({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.fullArticleUrl,
  });

  factory NewsStory.fromJson(Map<String, dynamic> json) {
    return NewsStory(
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      fullArticleUrl: json['fullArticleUrl'],
    );
  }
}