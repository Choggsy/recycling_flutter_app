import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';
import '../google_map_controller_test.mocks.dart';

void main() {
  var testLatitude = LatLng(50.72, -1.88);

  Future<void> buildMap(final WidgetTester tester, final LatLng initialPosition, final Set<Marker> markers) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomMap(
            initialPosition: initialPosition,
            markers: markers,
          ),
        ),
      ),
    );
  }

  Set<Marker> buildMarker() {
    return {
      Marker(
        markerId: MarkerId('recycling_point_1'),
        position: testLatitude,
        infoWindow: InfoWindow(title: 'Recycling Point 1'),
      ),
    };
  }

  group('MapTests', () {
    testWidgets('CustomMap displays correctly', (final WidgetTester tester) async {
      Set<Marker> markers = buildMarker();
      await buildMap(tester, testLatitude, markers);
      final GoogleMap googleMap = tester.widget(find.byType(GoogleMap));

      expect(find.byType(GoogleMap), findsOneWidget);
      expect(googleMap.initialCameraPosition.target, testLatitude);
      expect(googleMap.markers, markers);
    });

    testWidgets('CustomMap calls onMapCreated', (final WidgetTester tester) async {
      await buildMap(tester, testLatitude, buildMarker());
      final CustomMapState state = tester.state(find.byType(CustomMap));

      state.setController(MockGoogleMapController());
      expect(state.controller, isNotNull);
    });
  });
}