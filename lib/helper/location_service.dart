import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }
}
