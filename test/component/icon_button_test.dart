import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/icon_button.dart';

typedef GetPageCallback = Widget Function(int index);

class MockPage extends StatelessWidget {
  final int index;
  const MockPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Page $index'));
  }
}

void main() {
  const testIndex = 1;
  const testLabel = 'Test Icon';
  const testAsset = 'assets/logo/placeholder.jpg';

  Widget buildTestWidget({
    required int index,
    required GetPageCallback getPage,
    required String assetPath,
    required String semanticLabel,
    Color? backgroundColor,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: IconTileButton(
          index: index,
          getPage: getPage,
          assetPath: assetPath,
          semanticLabel: semanticLabel,
          backgroundColor: backgroundColor ?? Colors.white,
        ),
      ),
    );
  }

  testWidgets('renders semantic label and image', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(
      index: testIndex,
      getPage: (i) => MockPage(i),
      assetPath: testAsset,
      semanticLabel: testLabel,
    ));

    expect(find.bySemanticsLabel(testLabel), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('navigates to correct page on tap', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(
      index: testIndex,
      getPage: (i) => MockPage(i),
      assetPath: testAsset,
      semanticLabel: testLabel,
    ));

    await tester.tap(find.byType(IconTileButton));
    await tester.pumpAndSettle();

    expect(find.text('Page $testIndex'), findsOneWidget);
  });

  testWidgets('applies custom background color', (WidgetTester tester) async {
    const customColor = Colors.red;

    await tester.pumpWidget(buildTestWidget(
      index: testIndex,
      getPage: (i) => MockPage(i),
      assetPath: testAsset,
      semanticLabel: testLabel,
      backgroundColor: customColor,
    ));

    final container = tester.widget<Container>(find.descendant(
      of: find.byType(IconTileButton),
      matching: find.byType(Container),
    ));

    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, customColor);
  });
}
