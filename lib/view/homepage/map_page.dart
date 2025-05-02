import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/helper/button_helper.dart';
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
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Set<Marker>>(
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
          ),
          SizedBox(
            height: 80.0, // Increased height for larger buttons
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton(context, 'Flexible Plastic', BitmapDescriptor.hueRed),
                  _buildCategoryButton(context, 'Glass', BitmapDescriptor.hueCyan),
                  _buildCategoryButton(context, 'Textiles', BitmapDescriptor.hueYellow),
                  _buildCategoryButton(context, 'Electronic Waste', BitmapDescriptor.hueBlue),
                  _buildCategoryButton(context, 'Garden Waste', BitmapDescriptor.hueGreen),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String category, double hue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ElevatedButton(
        onPressed: () {
          // TODO: Handle button press
        },
        style: TileButtonStyles.buttonStyle(false, Color.fromRGBO((hue * 255).toInt(), 0, 0, 1)), // Use the buttonStyle method
        child: Container(
          width: 140,
          height: 80,
          decoration: TileButtonStyles.containerDecoration(false, Color.fromRGBO((hue * 255).toInt(), 0, 0, 1)), // Use the containerDecoration method
          alignment: Alignment.center,
          child: Text(category),
        ),
      ),
    );
  }
}

