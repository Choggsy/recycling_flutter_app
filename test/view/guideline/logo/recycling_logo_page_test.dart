import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/component/logo_button.dart';
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart';

void main() {
  Future<Map<String, dynamic>> mockLoadValid() async => {
    'recyclable': [
      {
        'imageUrl': 'assets/images/mockLogo.png',
        'title': 'Recycle Me',
        'description': 'This logo means recyclable',
      }
    ]
  };

  Future<Map<String, dynamic>> mockLoadError() async {
    throw Exception('Failed to load');
  }

  Future<Map<String, dynamic>> mockLoadEmpty() async => {'recyclable': []};

  Widget createTestWidget(Future<Map<String, dynamic>> Function()? loader) {
    return MaterialApp(
      home: RecyclableLogoPage(loader: loader),
    );
  }

  testWidgets('Displays loading indicator during fetch', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(mockLoadValid));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('Displays error message when fetch fails', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(mockLoadError));
    await tester.pumpAndSettle();
    expect(find.text('Error loading logos'), findsOneWidget);
  });

  testWidgets('Displays no logos when list is empty', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(mockLoadEmpty));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsNothing);
  });

  testWidgets('Displays logo cards when data is valid', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(mockLoadValid));
    await tester.pumpAndSettle();
    expect(find.text('Recycle Me'), findsOneWidget);
    expect(find.text('This logo means recyclable'), findsOneWidget);
  });

  testWidgets('RecyclableLogoPage has a title', (
    final WidgetTester tester,
  ) async {
    await buildPage(tester);

    expect(find.text('Logos Guide'), findsOneWidget);
  });

  testWidgets('RecyclableLogoPage has buttons', (
    final WidgetTester tester,
  ) async {
    await buildPage(tester);

    expect(find.widgetWithText(LogoButton, 'Recyclable'), findsOneWidget);
    expect(find.widgetWithText(LogoButton, 'Sustainable'), findsOneWidget);
    expect(find.widgetWithText(LogoButton, 'Other Logos'), findsOneWidget);
  });

  testWidgets('RecyclableLogoPage navigates back to GuidelinesPage', (
    final WidgetTester tester,
  ) async {
    await buildPage(tester);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(GuidelinesPage), findsOneWidget);
  });
}

Future<void> buildPage(final WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: RecyclableLogoPage()));
}
