import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/main.dart';
import 'package:recycling_flutter_app/view/home_page.dart';

void main() {

  testWidgets('MyApp has a title and home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify the home page is displayed
    expect(find.byType(HomePage), findsOneWidget);
  });
}
