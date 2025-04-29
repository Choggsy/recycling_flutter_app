import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';

class MarkerParser {
  static Set<Marker> parseMarkers(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map<Marker>((json) {
      return Marker(
        markerId: MarkerId(json['id']),
        position: LatLng(json['lat'], json['lng']),
        infoWindow: InfoWindow(title: json['title']),
      );
    }).toSet();
  }
}
