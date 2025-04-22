import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/room_guide_page.dart';

void main() {
  testWidgets('RoomSelectionPage has a title', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.text('Room Selection'), findsOneWidget);
  });

  testWidgets('RoomSelectionPage has center text', (final WidgetTester tester) async {
    await buildPage(tester);

    expect(find.text('This is the Room Selection Page'), findsOneWidget);
  });
}

Future<void> buildPage(final WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: RoomSelectionPage(),
    ),
  );
}
