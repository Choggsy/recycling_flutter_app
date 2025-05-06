import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart';

import '../../component/map_module.dart';
import '../../helper/mark_parser.dart';
import 'home_page.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final GlobalKey<CustomMapState> _mapKey = GlobalKey<CustomMapState>();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          buildFutureBuilder(),
          buildFilterButtons(),
        ],
      ),
    );
  }

  FutureBuilder<Set<Marker>> buildFutureBuilder() {
    return FutureBuilder<Set<Marker>>(
          future: MarkerParser.parseMarkers('assets/markers.json', (marker) {
            _mapKey.currentState?.onMarkerTapped(marker);
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading markers'));
            } else {
              return CustomMap(
                key: _mapKey,
                initialPosition: LatLng(50.7200, -1.8800), // Bournemouth placeholder for prototype
                markers: snapshot.data!,
                fullView: true,
              );
            }
          },
        );
  }

  Positioned buildFilterButtons() {
    return Positioned(
      top: 20.0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              for (final category in [
                'All',
                'Flexible Plastic',
                'Glass',
                'Textiles',
                'Electronic Waste',
                'Garden Waste'
              ])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _mapKey.currentState?.filterMarkers(category);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.black,
                      side: BorderSide(color: AppColors.darkBrown, width: 2), // Dark brown border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Square corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text(category),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}