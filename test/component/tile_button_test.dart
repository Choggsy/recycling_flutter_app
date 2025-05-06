import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';

void main() {
  const String imagePath = 'assets/logo/placeholder.jpg';

  testWidgets('TileButton displays the image', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TileButton(
          imagePath: imagePath,
          index: 0,
          getPage: (index) => Text('Page $index'),
        ),
      ),
    ));

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('TileButton navigates to correct page on tap', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TileButton(
          imagePath: imagePath,
          index: 1,
          getPage: (index) => Text('Page $index'),
        ),
      ),
    ));

    await tester.tap(find.byType(TileButton));
    await tester.pumpAndSettle();

    expect(find.text('Page 1'), findsOneWidget);
  });
}
