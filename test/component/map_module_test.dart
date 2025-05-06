import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';
import '../google_map_controller_test.mocks.dart';

void main() {
  const LatLng testLatLng = LatLng(50.72, -1.88);
  const String defaultMarkerId = 'recycling_point_1';
  const String defaultMarkerTitle = 'Recycling Point 1';
  const String plastic = 'Plastic';
  const String glass = 'Glass';

  Set<Marker> buildMarkers({String? id, String? title}) {
    return {
      Marker(
        markerId: MarkerId(id ?? defaultMarkerId),
        position: testLatLng,
        infoWindow: InfoWindow(title: title ?? defaultMarkerTitle),
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

      final CustomMapState state = tester.state(find.byType(CustomMap));
      final mockController = MockGoogleMapController();

      state.setController(mockController);
      expect(state.controller, equals(mockController));
    });

    testWidgets('dispose cleans up controller', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: buildMarkers());
      final CustomMapState state = tester.state(find.byType(CustomMap));
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

      final CustomMapState state = tester.state(find.byType(CustomMap));
      final newMarkers = buildMarkers().toList();

      state.updateMarkers(newMarkers);
      await tester.pump();

      expect(state.controller, isNull);
      expect(state.markers.length, newMarkers.length);
    });

    testWidgets('filters markers by category', (tester) async {
      final markers = {
        Marker(
          markerId: MarkerId('1'),
          position: testLatLng,
          infoWindow: InfoWindow(title: plastic),
        ),
        Marker(
          markerId: MarkerId('2'),
          position: testLatLng,
          infoWindow: InfoWindow(title: glass),
        ),
      };

      await pumpMapWidget(tester, initialPosition: testLatLng, markers: markers);

      final CustomMapState state = tester.state(find.byType(CustomMap));
      state.filterMarkers(plastic);
      await tester.pump();

      expect(state.markers.any((m) => m.infoWindow.title == plastic), isTrue);
      expect(state.markers.any((m) => m.infoWindow.title == glass), isFalse);
    });

    testWidgets('adds fallback marker when no category matches', (tester) async {
      await pumpMapWidget(tester, initialPosition: testLatLng, markers: {});

      final CustomMapState state = tester.state(find.byType(CustomMap));
      state.filterMarkers('Nonexistent Category');
      await tester.pump();

      expect(state.markers.any((m) => m.infoWindow.title == 'Your Location'), isTrue);
    });

    testWidgets('onMarkerTapped shows bottom sheet with marker info', (tester) async {
      final marker = Marker(
        markerId: MarkerId('test'),
        position: testLatLng,
        infoWindow: InfoWindow(title: 'Test Title', snippet: 'Test Description'),
      );

      await pumpMapWidget(tester, initialPosition: testLatLng, markers: {marker});

      final CustomMapState state = tester.state(find.byType(CustomMap));
      state.onMarkerTapped(marker);
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}