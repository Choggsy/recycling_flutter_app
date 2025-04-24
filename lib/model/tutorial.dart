class Tutorial {
  final String imagePath;
  final String title;
  final String description;
  final List<String> supplies;
  final List<String> instructions;
  final List<String> categories;

  Tutorial({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.supplies,
    required this.instructions,
    required this.categories,
  });

  factory Tutorial.fromJson(Map<String, dynamic> json) {
    return Tutorial(
      imagePath: json['photo'] ?? '',
      title: json['title'] ?? 'Unknown Title',
      description: json['description'] ?? 'No description available.',
      supplies: List<String>.from(json['supplies'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      categories: List<String>.from(json['categories'] ?? []),
    );
  }
}