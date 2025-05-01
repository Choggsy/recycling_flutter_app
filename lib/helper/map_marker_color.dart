import 'package:google_maps_flutter/google_maps_flutter.dart';

double getMarkerColor(final String category) {
  switch (category) {
    case 'Plastic':
      return BitmapDescriptor.hueGreen;
    case 'Glass':
      return BitmapDescriptor.hueOrange;
    default:
      return BitmapDescriptor.hueRed;
  }
}
