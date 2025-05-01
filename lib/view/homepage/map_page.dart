import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../component/map_module.dart';
import '../../helper/mark_parser.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final String jsonMarkers = '''
  [
    {"id": "recycling_point_1", "lat": 51.5074, "lng": -0.1278, "title": "Recycling Point 1", "category": "Flexible Plastic", "description": "Accepts all types of flexible plastic waste."},
    {"id": "recycling_point_2", "lat": 51.5075, "lng": -0.1279, "title": "Recycling Point 2", "category": "Glass", "description": "Accepts glass bottles and jars."}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = MarkerParser.parseMarkers(jsonMarkers, (marker) {
      CustomMapState().onMarkerTapped(marker);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomMap(
        initialPosition: LatLng(51.5074, -0.1278),
        markers: markers,
        fullView: true,
      ),
    );
  }
}
