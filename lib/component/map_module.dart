import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import '../helper/location_service.dart';

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
  GoogleMapController? get controller => _controller;
  final Completer<void> _mapCreatedCompleter = Completer<void>();
  LatLng _currentPosition = LatLng(50.7200, -1.8800); // Bournemouth
  Set<Marker> _markers = {};
  List<Marker> _allMarkers = [];
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _allMarkers = widget.markers.toList();
    _markers = widget.markers;
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void setController(final GoogleMapController controller) {
    _controller = controller;
  }

  void updateMarkers(List<Marker> markers) {
    setState(() {
      _allMarkers = markers;
      _markers = markers.toSet();
    });
  }

  void filterMarkers(String category) {
    setState(() {
      if (category == 'All') {
        _markers = _allMarkers.toSet();
      } else {
        _markers = _allMarkers
            .where((marker) => marker.infoWindow.title?.contains(category) ?? false)
            .toSet();
      }
    });
  }

  void _getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: _currentPosition,
            infoWindow: InfoWindow(title: 'Your Location'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          ),
        );
      });
      _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
    }
  }

  void onMarkerTapped(final Marker marker) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(marker.infoWindow.title ?? 'No Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Text(marker.infoWindow.snippet ?? 'No Description'),
            ],
          ),
        );
      },
    );
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