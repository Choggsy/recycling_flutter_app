import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/model/material.dart';

void main() {
  group('MaterialItem', () {
    test('fromJson correctly parses valid JSON', () {
      final json = {
        'title': 'Plastic Bottle',
        'description': 'A recyclable plastic container.',
        'image': 'assets/images/plastic_bottle.png',
        'contaminators': ['food residue', 'oil']
      };

      final item = MaterialItem.fromJson(json);

      expect(item.title, 'Plastic Bottle');
      expect(item.description, 'A recyclable plastic container.');
      expect(item.image, 'assets/images/plastic_bottle.png');
      expect(item.contaminators, ['food residue', 'oil']);
    });

    test('fromJson throws if contaminators is not a list', () {
      final json = {
        'title': 'Glass Jar',
        'description': 'A clean glass jar.',
        'image': 'assets/images/glass_jar.png',
        'contaminators': 'grease' // Incorrect type
      };

      expect(() => MaterialItem.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws if required fields are missing', () {
      final json = {
        'title': 'Aluminum Can',
        // Missing description, image, contaminators
      };

      expect(() => MaterialItem.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
