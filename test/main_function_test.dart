import 'package:flutter/cupertino.dart' show runApp;
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/main.dart';
import 'package:recycling_flutter_app/view/home_page.dart';

void main() {
  testWidgets('main function runs App', (final WidgetTester tester) async {
    runApp(const MyApp()); // Initialize the app

    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });
}
