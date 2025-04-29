import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';

import '../../helper/mark_parser.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final String jsonMarkers = '''
  [
    {"id": "recycling_point_1", "lat": 51.5074, "lng": -0.1278, "title": "Recycling Point 1"},
    {"id": "recycling_point_2", "lat": 51.5075, "lng": -0.1279, "title": "Recycling Point 2"}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = MarkerParser.parseMarkers(jsonMarkers);

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
        fullView: true, // Change to false for partial view
      ),
    );
  }
}