import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:recycling_flutter_app/helper/mark_parser.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MarkerParser', () {
    test('parseMarkers returns correct markers', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
        return ByteData.view(Uint8List.fromList(utf8.encode('''
      [
        {
          "id": "1",
          "lat": 51.5074,
          "lng": -0.1278,
          "title": "Marker 1",
          "description": "Description 1",
          "category": "Flexible Plastic"
        },
        {
          "id": "2",
          "lat": 48.8566,
          "lng": 2.3522,
          "title": "Marker 2",
          "description": "Description 2",
          "category": "Glass"
        }
      ]
      ''')).buffer);
      });

      final Set<Marker> markers = await MarkerParser.parseMarkers('assets/mock.json', (Marker marker) {});

      expect(markers.length, 2);
      expect(markers.any((marker) => marker.markerId.value == '1' && marker.position == LatLng(51.5074, -0.1278)), true);
      expect(markers.any((marker) => marker.markerId.value == '2' && marker.position == LatLng(48.8566, 2.3522)), true);
    });

    test('parseMarkers calls infoTap callback', () async {
      bool infoTapCalled = false;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
        return ByteData.view(Uint8List.fromList(utf8.encode('''
      [
        {
          "id": "1",
          "lat": 51.5074,
          "lng": -0.1278,
          "title": "Marker 1",
          "description": "Description 1",
          "category": "Flexible Plastic"
        }
      ]
      ''')).buffer);
      });

      (await MarkerParser.parseMarkers('assets/mock.json', (Marker marker) {
        infoTapCalled = true;
      })).first.onTap!();

      expect(infoTapCalled, true);
    });
  });
}
