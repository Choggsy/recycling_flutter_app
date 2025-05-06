import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/helper/map_marker_color.dart';

class MarkerParser {
  //fixme: use google_maps_cluster_manager to improve performance and usability on markers.
  static Future<Set<Marker>> parseMarkers(final String jsonFilePath, final Function(Marker) infoTap) async {
    final String jsonString = await rootBundle.loadString(jsonFilePath);
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