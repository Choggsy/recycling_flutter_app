import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/properties/button_style.dart';

void main() {
  Widget mockPage(int index) => Scaffold(body: Text('Page $index'));

  Widget createTestWidget(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('iconTile renders with label and image', (WidgetTester tester) async {
    await buildButton(tester, mockPage);

    expect(find.text('Test Label'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('buildTileButton renders and navigates on tap', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) => ButtonStyles.buildTileButton('Test Button', 1, mockPage, context),),
    ));

    expect(find.text('Test Button'), findsOneWidget);
    await tester.tap(find.byType(TileButton));
    await tester.pumpAndSettle();

    expect(find.text('Page 1'), findsOneWidget);
  });

  testWidgets('positioningConditions renders label on the left', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(
        ButtonStyles.positioningConditions('left', true, const Text('Label'), Image.asset('assets/logo/placeholder.jpg'),)));
    expect(find.text('Label'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}

Future<void> buildButton(final WidgetTester tester, final Widget Function(int index) mockPage) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          return StaggeredGrid.count(
            crossAxisCount: 4,
            children: [
              ButtonStyles.iconTile(
                context: context,
                index: 0,
                getPage: mockPage,
                label: 'Test Label',
                assetPath: 'assets/logo/placeholder.jpg',
              ),
            ],
          );
        },
      ),
    ),
  ));
}
