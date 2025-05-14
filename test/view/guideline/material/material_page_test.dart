import 'dart:convert';

import 'package:flutter/material.dart'
    show CircularProgressIndicator, MaterialApp;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/view/guideline/material/material_page.dart'
    show MaterialPage;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
      (message) async {
        final Uint8List encoded = Uint8List.fromList(utf8.encode('''
    [
      {
        "title": "Plastic",
        "description": "A synthetic material",
        "image": "assets/plastic.png",
        "contaminators": ["Chemicals", "Oil"]
      }
    ]
    '''));
        return encoded.buffer.asByteData();
      },
    );
  });

  tearDown(() {
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
      null,
    );
  });

  testWidgets('shows loading indicator while fetching data', (
    WidgetTester tester,
  ) async {
    await (WidgetTester tester, String testMaterialTitle) async {
      await tester.pumpWidget(
        MaterialApp(home: MaterialPage(materialTitle: testMaterialTitle)),
      );
    }(tester, 'Plastic');

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}