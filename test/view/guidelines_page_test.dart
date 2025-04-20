import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_page.dart' show getPage;
import 'package:recycling_flutter_app/layout_widgets/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/view/guidlines_page.dart' show GuidelinesPage;

void main() {
  testWidgets('GuidelinesPage has a title and body text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GuidelinesPage()));

    // Verify the body text
    expect(find.text('Guidelines Page'), findsOneWidget);
  });
}
