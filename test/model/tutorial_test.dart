import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/model/tutorial.dart';

void main() {
    test('fromJson should create a valid Tutorial object', () {
      final json = {
        'photo': 'assets/logo/placeholder.jpg',
        'title': 'DIY Project',
        'description': 'A fun and easy project to try.',
        'supplies': ['Glue', 'Scissors', 'Paper'],
        'instructions': ['Step 1', 'Step 2', 'Step 3'],
        'categories': ['Craft', 'DIY']
      };

      final tutorial = Tutorial.fromJson(json);

      expect(tutorial.imagePath, 'assets/logo/placeholder.jpg');
      expect(tutorial.title, 'DIY Project');
      expect(tutorial.description, 'A fun and easy project to try.');
      expect(tutorial.supplies, ['Glue', 'Scissors', 'Paper']);
      expect(tutorial.instructions, ['Step 1', 'Step 2', 'Step 3']);
      expect(tutorial.categories, ['Craft', 'DIY']);
    });

    test('fromJson should handle missing fields gracefully', () {
      final tutorial = Tutorial.fromJson({});

      expect(tutorial.imagePath, '');
      expect(tutorial.title, 'Unknown Title');
      expect(tutorial.description, 'No description available.');
      expect(tutorial.supplies, []);
      expect(tutorial.instructions, []);
      expect(tutorial.categories, []);
    });
}