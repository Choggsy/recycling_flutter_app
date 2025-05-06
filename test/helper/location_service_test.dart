import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:recycling_flutter_app/helper/location_service.dart';

class MockGeolocatorPlatform extends GeolocatorPlatform {
  bool serviceEnabled = true;
  LocationPermission permission = LocationPermission.always;
  Position? position;

  @override
  Future<bool> isLocationServiceEnabled() async => serviceEnabled;

  @override
  Future<LocationPermission> checkPermission() async => permission;

  @override
  Future<LocationPermission> requestPermission() async => permission;

  @override
  Future<Position> getCurrentPosition({LocationSettings? locationSettings}) async {
    if (position != null) return position!;
    throw Exception('Position not set');
  }
}

void main() {
  late LocationService locationService;
  late MockGeolocatorPlatform mockGeolocator;

  setUp(() {
    mockGeolocator = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = mockGeolocator;
    locationService = LocationService();
  });

  test('returns position when permissions are granted and service is enabled', () async {
    mockGeolocator.serviceEnabled = true;
    mockGeolocator.permission = LocationPermission.always;
    mockGeolocator.position = Position(
      latitude: 10.0,
      longitude: 20.0,
      timestamp: DateTime.now(),
      accuracy: 1.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );

    final result = await locationService.getCurrentLocation();

    expect(result, isNotNull);
    expect(result!.latitude, 10.0);
    expect(result.longitude, 20.0);
  });

  test('returns null when location service is disabled', () async {
    mockGeolocator.serviceEnabled = false;

    final result = await locationService.getCurrentLocation();

    expect(result, isNull);
  });

  test('returns null when permission is denied', () async {
    mockGeolocator.serviceEnabled = true;
    mockGeolocator.permission = LocationPermission.denied;

    final result = await locationService.getCurrentLocation();

    expect(result, isNull);
  });

  test('returns null when permission is denied forever', () async {
    mockGeolocator.serviceEnabled = true;
    mockGeolocator.permission = LocationPermission.deniedForever;

    final result = await locationService.getCurrentLocation();

    expect(result, isNull);
  });
}
