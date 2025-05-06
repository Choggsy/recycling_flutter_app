import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/model/fact.dart';

void main() {
  group('RecyclingFact', () {
    void verifyFact(
      final RecyclingFact fact,
      final int expectedId,
      final String expectedTitle,
      final String expectedDescription,
    ) {
      expect(fact.id, expectedId);
      expect(fact.title, expectedTitle);
      expect(fact.description, expectedDescription);
    }

    test('should create an instance with correct values', () {
      final fact = RecyclingFact(
        id: 1,
        title: 'Recycling Saves Energy',
        description:
            'Recycling aluminum saves 95% of the energy needed to make new aluminum.',
      );

      verifyFact(
        fact,
        1,
        'Recycling Saves Energy',
        'Recycling aluminum saves 95% of the energy needed to make new aluminum.',
      );
    });

    test('should create an instance from JSON', () {
      final json = {
        'ID': 2,
        'Title': 'Plastic Recycling',
        'Description':
            'Only 9% of plastic waste ever produced has been recycled.',
      };


      verifyFact(
        RecyclingFact.fromJson(json),
        2,
        'Plastic Recycling',
        'Only 9% of plastic waste ever produced has been recycled.',
      );
    });
  });
}
