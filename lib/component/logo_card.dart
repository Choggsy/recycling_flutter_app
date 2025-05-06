import 'package:flutter/material.dart';
import '../helper/space_helper.dart';
import '../properties/device_view_vector.dart';

class LogoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Widget? imageWidget; // testing optional parameter

  const LogoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = ScreenConfig.getImageSize(screenWidth, 'medium');

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            imageWidget ??
                Image.network(
                  imageUrl,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 48.0);
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Space.medium.box,
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}