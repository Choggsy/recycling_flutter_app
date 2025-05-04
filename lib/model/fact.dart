class RecyclingFact {
  final int id;
  final String title;
  final String description;

  RecyclingFact({required this.id, required this.title, required this.description});

  factory RecyclingFact.fromJson(Map<String, dynamic> json) {
    return RecyclingFact(
      id: json['ID'],
      title: json['Title'],
      description: json['Description'],
    );
  }
}
