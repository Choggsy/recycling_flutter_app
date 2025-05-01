import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/helper/mark_parser.dart';

void main() {
  test('parseMarkers returns a set of markers', () {
    const jsonString = '''
    [
      {"id": "1", "lat": 37.7749, "lng": -122.4194, "title": "Marker 1", "description": "Description 1", "category": "recycling"},
      {"id": "2", "lat": 34.0522, "lng": -118.2437, "title": "Marker 2", "description": "Description 2", "category": "waste"}
    ]
    ''';

    Set<Marker> markers = MarkerParser.parseMarkers(jsonString, (marker) {});
    expect(markers.length, 2);
    expect(markers.any((marker) => marker.markerId.value == '1'), true);
    expect(markers.any((marker) => marker.markerId.value == '2'), true);
  });

  test('parseMarkers calls infoTap callback', () {
    bool infoTapCalled = false;
    const jsonString = '''
    [
      {"id": "1", "lat": 37.7749, "lng": -122.4194, "title": "Marker 1", "description": "Description 1", "category": "recycling"}
    ]
    ''';

    MarkerParser.parseMarkers(jsonString, (marker) {
      infoTapCalled = true;
    }).first.onTap!();
    expect(infoTapCalled, true);
  });
}
