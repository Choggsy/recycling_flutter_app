import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class CustomMap extends StatefulWidget {
  final LatLng initialPosition;
  final Set<Marker> markers;

  const CustomMap({
    super.key,
    required this.initialPosition,
    required this.markers,
  });

  @override
  State<CustomMap> createState() => CustomMapState();
}

class CustomMapState extends State<CustomMap> {
  GoogleMapController? _controller;
  final Completer<void> _mapCreatedCompleter = Completer<void>();

  GoogleMapController? get controller => _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void setController(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.initialPosition,
        zoom: 14.0, //TODO: COULD CHANGE FOR VIEW ON PHONE VS TABLET
      ),
      markers: widget.markers,
      onMapCreated: (controller) {
        _controller = controller;
        if (!_mapCreatedCompleter.isCompleted) {
          _mapCreatedCompleter.complete();
        }
      },
    );
  }
}