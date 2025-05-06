class MaterialItem {
  final String title;
  final String description;
  final String image;
  final List<String> contaminators;

  MaterialItem({
    required this.title,
    required this.description,
    required this.image,
    required this.contaminators,
  });

  factory MaterialItem.fromJson(final Map<String, dynamic> json) {
    return MaterialItem(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      contaminators: List<String>.from(json['contaminators']),
    );
  }
}
