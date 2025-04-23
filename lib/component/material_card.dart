import 'package:flutter/material.dart';

import '../properties/device_view_vector.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = ScreenConfig.getImageSize(screenWidth, 'medium');
    double fontSize = ScreenConfig.getViewType(screenWidth) == ViewType.phone ? 18.0 : 24.0;
    double descriptionFontSize = ScreenConfig.getViewType(screenWidth) == ViewType.phone ? 14.0 : 18.0;

    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: imageSize,
              height: imageSize,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                key: Key('materialTitle_$title'), // Add a key to the title Text widget
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Contaminators: ${contaminators.join(', ')}',
                style: TextStyle(color: Colors.red, fontSize: fontSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  description,
                  style: TextStyle(fontSize: descriptionFontSize), // Adjust the font size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
