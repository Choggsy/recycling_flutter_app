import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerParser {
  static Set<Marker> parseMarkers(String jsonString, Function(Marker) onTap) {
    final List jsonList = json.decode(jsonString);
    return jsonList.map((json) {
      return Marker(
        markerId: MarkerId(json['id']),
        position: LatLng(json['lat'], json['lng']),
        infoWindow: InfoWindow(
          title: json['title'],
          snippet: json['description'],
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          _getMarkerColor(json['category']),
        ),
        onTap: () {
          onTap(Marker(
            markerId: MarkerId(json['id']),
            position: LatLng(json['lat'], json['lng']),
            infoWindow: InfoWindow(
              title: json['title'],
              snippet: json['description'],
            ),
          ));
        },
      );
    }).toSet();
  }

  static double _getMarkerColor(String category) {
    switch (category) {
      case 'Plastic':
        return BitmapDescriptor.hueGreen;
      case 'Glass':
        return BitmapDescriptor.hueBlue;
      default:
        return BitmapDescriptor.hueRed;
    }
  }
}
