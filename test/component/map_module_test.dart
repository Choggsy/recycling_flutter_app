import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';
import '../google_map_controller_test.mocks.dart';

void main() {
  const LatLng testLatLng = LatLng(50.72, -1.88);

  Marker createMarker({
    required String id,
    required String title,
    String? snippet,
    LatLng position = testLatLng,
  }) {
    return Marker(
      markerId: MarkerId(id),
      position: position,
      infoWindow: InfoWindow(title: title, snippet: snippet),
    );
  }

  Set<Marker> buildMarkers({String? id, String? title}) {
    return {
      createMarker(
        id: id ?? 'recycling_point_1',
        title: title ?? 'Recycling Point 1',
      ),
    };
  }

  Future<void> pumpMapWidget(
      WidgetTester tester, {
        required LatLng initialPosition,
        required Set<Marker> markers,
        bool fullView = true,
      }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomMap(
            initialPosition: initialPosition,
            markers: markers,
            fullView: fullView,
          ),
        ),
      ),
    );
  }

  Future<CustomMapState> getMapState(WidgetTester tester) async {
    return tester.state(find.byType(CustomMap));
  }

  group('Map Widget Tests', () {
    testWidgets('renders GoogleMap with correct initial position and markers', (tester) async {
      final markers = buildMarkers();
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: markers);

      final GoogleMap googleMap = tester.widget(find.byType(GoogleMap));
      expect(find.byType(GoogleMap), findsOneWidget);
      expect(googleMap.initialCameraPosition.target, testLatLng);
      expect(googleMap.markers, markers);
    });

    testWidgets('sets and retrieves GoogleMapController', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: buildMarkers());

      final state = await getMapState(tester);
      final mockController = MockGoogleMapController();

      state.setController(mockController);
      expect(state.controller, equals(mockController));
    });

    testWidgets('dispose cleans up controller', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: buildMarkers());
      final state = await getMapState(tester);
      state.setController(MockGoogleMapController());

      await tester.pumpWidget(Container());
      expect(() => state.controller?.dispose(), returnsNormally);
    });

    testWidgets('renders map with reduced height when fullView is false', (tester) async {
      await pumpMapWidget(
        tester,
        initialPosition: testLatLng,
        markers: buildMarkers(),
        fullView: false,
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 200.0);
    });
  });

  group('Marker & Filter Logic Tests', () {
    testWidgets('updates markers using updateMarkers()', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: {});
      final state = await getMapState(tester);

      final newMarkers = buildMarkers().toList();
      state.updateMarkers(newMarkers);
      await tester.pump();

      expect(state.controller, isNull);
      expect(state.markers.length, newMarkers.length);
    });

    testWidgets('filters markers by category', (tester) async {
      final markers = {
        createMarker(id: '1', title: 'Plastic'),
        createMarker(id: '2', title: 'Glass'),
      };

      await pumpMapWidget(tester, initialPosition: testLatLng, markers: markers);
      final state = await getMapState(tester);

      state.filterMarkers('Plastic');
      await tester.pump();

      expect(state.markers.any((m) => m.infoWindow.title == 'Plastic'), isTrue);
      expect(state.markers.any((m) => m.infoWindow.title == 'Glass'), isFalse);
    });

    testWidgets('adds fallback marker when no category matches', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: {});
      final state = await getMapState(tester);

      state.filterMarkers('Nonexistent Category');
      await tester.pump();

      expect(state.markers.any((m) => m.infoWindow.title == 'Your Location'), isTrue);
    });

    testWidgets('onMarkerTapped shows bottom sheet with marker info', (tester) async {
      final marker = createMarker(
        id: 'test',
        title: 'Test Title',
        snippet: 'Test Description',
      );

      await pumpMapWidget(tester, initialPosition: testLatLng, markers: {marker});
      final state = await getMapState(tester);

      state.onMarkerTapped(marker);
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}