import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;

void main() {
  testWidgets('CustomAppBar displays the correct title', (final WidgetTester tester) async {
    final String appBarTitle = 'Test Title';
    await appBarWidget(tester, appBarTitle);

    expect(find.text(appBarTitle), findsOneWidget);
  });

  testWidgets('CustomAppBar has the correct preferred size from device height', (final WidgetTester tester) async {
    await appBarWidget(tester, 'Test Title');
    final AppBar appBar = tester.widget(find.byType(AppBar));

    expect(appBar.preferredSize, equals(Size.fromHeight(kToolbarHeight)));
  });
}

Future<void> appBarWidget(final WidgetTester tester, final String appBarTitle) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(title: appBarTitle),
      ),
    ),
  );
}