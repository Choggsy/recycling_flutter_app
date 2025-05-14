import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/logo_button.dart';

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
  const testLabel = 'Test Button';
  const testIndex = 2;

  Widget buildTestWidget({
    required String label,
    required int index,
    required GetPageCallback getPage,
    Color? activeColor,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: LogoButton(
          label: label,
          index: index,
          getPage: getPage,
          activeColor: activeColor ?? Colors.white,
        ),
      ),
    );
  }

  testWidgets('renders button with correct label', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(
      label: testLabel,
      index: testIndex,
      getPage: (i) => MockPage(i),
    ));

    expect(find.text(testLabel), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('navigates to correct page on press', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(
      label: testLabel,
      index: testIndex,
      getPage: (i) => MockPage(i),
    ));

    await tester.tap(find.byKey(Key(testLabel)));
    await tester.pumpAndSettle();

    expect(find.text('Page $testIndex'), findsOneWidget);
  });

  testWidgets('applies active style when activeColor is not default', (WidgetTester tester) async {
    const customColor = Colors.green;

    await tester.pumpWidget(buildTestWidget(
      label: testLabel,
      index: testIndex,
      getPage: (i) => MockPage(i),
      activeColor: customColor,
    ));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, customColor);
  });
}
