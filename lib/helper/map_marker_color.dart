import 'package:google_maps_flutter/google_maps_flutter.dart';

double getMarkerColor(final String category) {
  switch (category) {
    case 'Flexible Plastic':
      return BitmapDescriptor.hueRed;
    case 'Glass':
      return BitmapDescriptor.hueCyan;
    case 'Textiles':
      return BitmapDescriptor.hueYellow;
    case 'Electronic Waste':
      return BitmapDescriptor.hueBlue;
    case 'Garden Waste':
      return BitmapDescriptor.hueGreen;
    default:
      return BitmapDescriptor.hueRose;
  }
}
