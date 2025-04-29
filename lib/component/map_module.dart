import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    return SizedBox(
      height: widget.fullView ? double.infinity : 200.0,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialPosition,
          zoom: 14.0,
        ),
        markers: widget.markers,
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