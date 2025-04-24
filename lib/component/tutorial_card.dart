import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<String> supplies;
  final List<String> instructions;

  const TutorialCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.supplies,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 10),
            Text(
              'Supplies:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...supplies.map((supply) => Text('- $supply')),
            SizedBox(height: 10),
            Text(
              'Instructions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...instructions.map((step) => Text('- $step')),
          ],
        ),
      ),
    );
  }
}