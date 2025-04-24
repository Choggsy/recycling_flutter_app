import 'package:flutter/material.dart';

import '../helper/space_helper.dart';

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
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Space.large.box,
              Text(
                title,
                style: theme.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Space.small.box,
              Text(
                description,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Space.medium.box,
              SizedBox(
                width: double.infinity, // Make the box span full width
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Supplies:',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      Space.small.box,
                      Text(
                        supplies.join(',  '), // Join all items into one string
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.left, // Left-align for readability
                      ),
                    ],
                  ),
                ),
              ),
              Space.medium.box,
              Text(
                'Instructions:',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Space.small.box,
              ...instructions.map(
                (step) => Text(
                  '- $step',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
