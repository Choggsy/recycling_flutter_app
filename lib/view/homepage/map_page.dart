import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/view/homepage/home_page.dart';
import '../../component/map_filter_buttons.dart';
import '../../component/map_module.dart';
import '../../helper/mark_parser.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
          Positioned(
            top: 20.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFilterButton(context, 'All'),
                  buildFilterButton(context, 'Flexible Plastic'),
                  buildFilterButton(context, 'Glass'),
                  buildFilterButton(context, 'Textiles'),
                  buildFilterButton(context, 'Electronic Waste'),
                  buildFilterButton(context, 'Garden Waste'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<Set<Marker>> buildFutureBuilder() {
    return FutureBuilder<Set<Marker>>(
          future: MarkerParser.parseMarkers('assets/markers.json', (marker) {
            CustomMapState().onMarkerTapped(marker);
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading markers'));
            } else {
              return CustomMap(
                initialPosition: LatLng(51.5074, -0.1278),
                markers: snapshot.data!,
                fullView: true,
              );
            }
          },
        );
  }
}