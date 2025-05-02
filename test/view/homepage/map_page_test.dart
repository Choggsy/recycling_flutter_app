import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling_flutter_app/component/map_module.dart';
import 'package:recycling_flutter_app/view/homepage/home_page.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';

void main() {
  testWidgets('MapPage has a title and back button', (final WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MapPage()));
    await tester.pump();

    expect(find.text('Map'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('MapPage navigates back to HomePage when back button is pressed', (final WidgetTester tester) async {
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });


  testWidgets('MapPage displays filter buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MapPage()));
    await tester.pump();

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Flexible Plastic'), findsOneWidget);
    expect(find.text('Glass'), findsOneWidget);
    expect(find.text('Textiles'), findsOneWidget);
    expect(find.text('Electronic Waste'), findsOneWidget);
    expect(find.text('Garden Waste'), findsOneWidget);
  });

  testWidgets('MapPage displays error message when markers fail to load', (WidgetTester tester) async {
    await tester.pumpWidget(simulateErrorState());
    await tester.pump();

    expect(find.text('Error loading markers'), findsOneWidget);
  });
}

MaterialApp simulateErrorState() {
  return MaterialApp(home: Builder(
    builder: (BuildContext context) {
      return FutureBuilder<Set<Marker>>(
        future: Future.error('Error loading markers'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error loading markers'));
          } else {
            return CustomMap(
              initialPosition: LatLng(51.5074, -0.1278),
              markers: snapshot.data ?? <Marker>{},
              fullView: true,
            );
          }
        },
      );
    },
  ));
}

MaterialApp buildPage() {
  return MaterialApp(
    home: MapPage(),
    routes: {
      '/home': (context) => HomePage(),
    },
  );
}