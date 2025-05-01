import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/helper/map_marker_color.dart';

class MarkerParser {
  static Set<Marker> parseMarkers(final String jsonString, final Function(Marker) infoTap) {
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
          getMarkerColor(json['category']),
        ),
        onTap: () {
          infoTap(Marker(
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
}