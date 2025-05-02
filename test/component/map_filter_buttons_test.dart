import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/map_filter_buttons.dart';
import 'package:recycling_flutter_app/properties/app_theme.dart';

void main() {
  testWidgets('buildFilterButton displays the correct text', (final WidgetTester tester) async {
    await buildButton(tester);
    expect(find.text('Test Category'), findsOneWidget);
  });

  testWidgets('buildFilterButton has correct styling', (final WidgetTester tester) async {
    await buildButton(tester);
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

    expect(button.style?.foregroundColor?.resolve({}), AppColors.darkBrown);
    expect(button.style?.backgroundColor?.resolve({}), AppColors.background);
    expect(button.style?.minimumSize?.resolve({}), Size(120, 80));
    expect(button.style?.shape?.resolve({}), isA<RoundedRectangleBorder>());
    expect((button.style?.shape?.resolve({}) as RoundedRectangleBorder).side,
        BorderSide(color: AppColors.darkBrown, width: 2));
  });

  testWidgets('buildFilterButton has correct padding and margin', (final WidgetTester tester) async {
    await buildButton(tester);

    expect(tester.widget<Container>(
        find.byType(Container)).margin,
        EdgeInsets.symmetric(horizontal: 4.0));
    expect(tester.widget<ElevatedButton>(
        find.byType(ElevatedButton)).style?.padding?.resolve({}),
        EdgeInsets.zero);
  });
}

Future<void> buildButton(final WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: Builder(
    builder: (BuildContext context) {
      return buildFilterButton(context, 'Test Category');
    },
  )));
}
