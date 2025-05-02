import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/room_guide_page.dart';

void main() {
  testWidgets('RoomSelectionPage has a title and message', (final WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RoomSelectionPage()));

    expect(find.text('Room Selection'), findsOneWidget);
    expect(find.text('This is the Room Selection Page'), findsOneWidget);
  });

  testWidgets('RoomSelectionPage has an AppBar', (final WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RoomSelectionPage()));

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('RoomSelectionPage has a Center widget', (final WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RoomSelectionPage()));

    expect(find.byType(Center), findsOneWidget);
  });
}
