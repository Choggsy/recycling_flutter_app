import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../component/map_module.dart';
import '../../helper/mark_parser.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<Set<Marker>>(
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
      ),
    );
  }
}
