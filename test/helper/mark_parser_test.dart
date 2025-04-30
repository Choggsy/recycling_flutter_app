import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/mark_parser.dart';

void main() {
  group('MarkerParser', () {
    test('parseMarkers returns correct markers', () {
      final markers = MarkerParser.parseMarkers('''
      [
        {"id": "1", "lat": 37.7749, "lng": -122.4194, "title": "San Francisco"},
        {"id": "2", "lat": 34.0522, "lng": -118.2437, "title": "Los Angeles"}
      ]
      ''');

      expect(markers.length, 2);
      expect(markers.any((marker) => marker.markerId.value == '1' && marker.position.latitude == 37.7749 && marker.position.longitude == -122.4194 && marker.infoWindow.title == 'San Francisco'), true);
      expect(markers.any((marker) => marker.markerId.value == '2' && marker.position.latitude == 34.0522 && marker.position.longitude == -118.2437 && marker.infoWindow.title == 'Los Angeles'), true);
    });

    test('parseMarkers handles empty JSON string', () {
      expect(MarkerParser.parseMarkers('[]').isEmpty, true);
    });

    test('parseMarkers handles invalid JSON string', () {
      expect(() => MarkerParser.parseMarkers('invalid json'), throwsA(isA<FormatException>()));
    });
  });
}
