

import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/helper/map_marker_color.dart';

void main() {
  group('getMarkerColor', () {
    test('returns hueRed for Flexible Plastic', () {
      expect(getMarkerColor('Flexible Plastic'), BitmapDescriptor.hueRed);
    });

    test('returns hueCyan for Glass', () {
      expect(getMarkerColor('Glass'), BitmapDescriptor.hueCyan);
    });

    test('returns hueYellow for Textiles', () {
      expect(getMarkerColor('Textiles'), BitmapDescriptor.hueYellow);
    });

    test('returns hueBlue for Electronic Waste', () {
      expect(getMarkerColor('Electronic Waste'), BitmapDescriptor.hueBlue);
    });

    test('returns hueGreen for Garden Waste', () {
      expect(getMarkerColor('Garden Waste'), BitmapDescriptor.hueGreen);
    });

    test('returns hueRose for unknown category', () {
      expect(getMarkerColor('Unknown Category'), BitmapDescriptor.hueRose);
    });
  });
}
