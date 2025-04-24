import 'package:flutter/material.dart';
import '../helper/space_helper.dart';
import '../model/tutorial.dart';

class TutorialCard extends StatelessWidget {
  final Tutorial tutorial;

  const TutorialCard({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width * 0.9;
    final screenHeight = MediaQuery.of(context).size.height * 0.25;

    return Card(
      color: theme.colorScheme.surface,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                tutorial.imagePath,
                width: screenWidth,
                height: screenHeight,
              ),
            ),
            Space.large.box,
            Text(
              tutorial.title,
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Space.small.box,
            Text(
              tutorial.description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Space.medium.box,
            _buildSuppliesBox(theme),
            Space.medium.box,
            _buildInstructions(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSuppliesBox(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Supplies:', style: theme.textTheme.bodyLarge),
          Space.small.box,
          Text(
            tutorial.supplies.join(', '), // Combines supplies into one comma-separated string
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Instructions:', style: theme.textTheme.bodyLarge),
        Space.small.box,
        for (final step in tutorial.instructions)
          Text(
            '- $step',
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
      ],
    );
  }
}
