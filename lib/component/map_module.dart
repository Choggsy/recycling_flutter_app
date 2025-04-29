import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class CustomMap extends StatefulWidget {
  final LatLng initialPosition;
  final Set<Marker> markers;
  final bool fullView;

  const CustomMap({
    super.key,
    required this.initialPosition,
    required this.markers,
    this.fullView = true,
  });

  @override
  State<CustomMap> createState() => CustomMapState();
}

class CustomMapState extends State<CustomMap> {
  GoogleMapController? _controller;
  final Completer<void> _mapCreatedCompleter = Completer<void>();
  LatLng _currentPosition = LatLng(0, 0);
  Set<Marker> _markers = {};

  GoogleMapController? get controller => _controller;

  @override
  void initState() {
    super.initState();
    _markers = widget.markers;
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void setController(GoogleMapController controller) {
    _controller = controller;
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request users to enable them.
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle appropriately.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: _currentPosition,
          infoWindow: InfoWindow(title: 'Your Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
    _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fullView ? double.infinity : 200.0,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          _controller = controller;
          if (!_mapCreatedCompleter.isCompleted) {
            _mapCreatedCompleter.complete();
          }
        },
      ),
    );
  }
}
