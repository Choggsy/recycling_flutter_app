import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> contaminators;

  const MaterialCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.contaminators,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              key: Key('materialTitle_$title'), // Add a key to the title Text widget
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contaminators: ${contaminators.join(', ')}',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
