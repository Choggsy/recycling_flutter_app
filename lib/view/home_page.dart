import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/component/map_module.dart';
import '../helper/get_page.dart';
import '../helper/mark_parser.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: CustomMap(
        initialPosition: LatLng(51.5074, -0.1278),
        markers: markers,
        fullView: true, // Change to false for partial view
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
      ),
    );
  }
}