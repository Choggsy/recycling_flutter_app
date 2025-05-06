import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';
import '../google_map_controller_test.mocks.dart';

void main() {
  const LatLng testLatitude = LatLng(50.72, -1.88);
  const String markerId = 'recycling_point_1';
  const String markerTitle = 'Recycling Point 1';

  Set<Marker> buildMarkers() {
    return {
      Marker(
        markerId: MarkerId(markerId),
        position: testLatitude,
        infoWindow: InfoWindow(title: markerTitle),
      ),
    };
  }

  Future<void> pumpMapWidget(
      WidgetTester tester, {
        required LatLng initialPosition,
        required Set<Marker> markers,
      }) async {
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

  group('CustomMap Widget Tests', () {
    testWidgets('renders GoogleMap with correct initial position and markers', (tester) async {
      final markers = buildMarkers();
      await pumpMapWidget(tester, initialPosition: testLatitude, markers: markers);

      final GoogleMap googleMap = tester.widget(find.byType(GoogleMap));
      expect(find.byType(GoogleMap), findsOneWidget);
      expect(googleMap.initialCameraPosition.target, testLatitude);
      expect(googleMap.markers, markers);
    });

    testWidgets('sets and retrieves GoogleMapController', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatitude, markers: buildMarkers());

      final CustomMapState state = tester.state(find.byType(CustomMap));
      final mockController = MockGoogleMapController();

      state.setController(mockController);
      expect(state.controller, equals(mockController));
    });

    testWidgets('updates markers using updateMarkers()', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatitude, markers: {});

      final CustomMapState state = tester.state(find.byType(CustomMap));
      final newMarkers = buildMarkers().toList();

      state.updateMarkers(newMarkers);
      await tester.pump();

      expect(state.controller, isNull); // controller not set in this test
      expect(state.markers.length, newMarkers.length);
    });

    testWidgets('filters markers by category', (tester) async {
      final markers = {
        Marker(
          markerId: MarkerId('1'),
          position: testLatitude,
          infoWindow: InfoWindow(title: 'Plastic'),
        ),
        Marker(
          markerId: MarkerId('2'),
          position: testLatitude,
          infoWindow: InfoWindow(title: 'Glass'),
        ),
      };

      await pumpMapWidget(tester, initialPosition: testLatitude, markers: markers);

      final CustomMapState state = tester.state(find.byType(CustomMap));
      state.filterMarkers('Plastic');
      await tester.pump();

      expect(state.markers.any((m) => m.infoWindow.title == 'Plastic'), isTrue);
      expect(state.markers.any((m) => m.infoWindow.title == 'Glass'), isFalse);
    });
  });
}
