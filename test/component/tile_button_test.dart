import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton;

void main() {
  final String label = 'Cardboard';

  testWidgets('TileButton displays the correct label', (final WidgetTester tester) async {
    await testApp(tester, label, 0);
    expect(find.text(label), findsOneWidget);
  });

  testWidgets('TileButton navigates to correct page on button press', (WidgetTester tester) async {
    final int index = 0;
    await testApp(tester, label, index);

    await tester.tap(find.byKey(Key(label)));
    await tester.pumpAndSettle();
    expect(find.text('Page $index'), findsOneWidget);
  });
}

Future<void> testApp(final WidgetTester tester, final String label, final int index) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: TileButton(
        label: label,
        index: index,
        getPage: (int index) => Text('Page $index'),
      ),
    ),
  ));
}
