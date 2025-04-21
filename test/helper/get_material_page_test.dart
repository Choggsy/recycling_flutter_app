import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/view/material/cardboard_page.dart';
import 'package:recycling_flutter_app/view/material/glass_page.dart';
import 'package:recycling_flutter_app/view/material/plastic_page.dart';

void main() {
  test('getMaterialPage returns CardboardPage for index 0', () {
    expect(getMaterialPage(0), isA<CardboardPage>());
  });

  test('getMaterialPage returns GlassPage for index 1', () {
    expect(getMaterialPage(1), isA<GlassPage>());
  });

  test('getMaterialPage returns PlasticPage for index 2', () {
    expect(getMaterialPage(2), isA<PlasticPage>());
  });

  for (var index in [3, 4, 5, 999, -1]) {
    test('getMaterialPage returns GuidelinesPage for outOfBounds index $index', () {
      expect(getMaterialPage(index), isA<GuidelinesPage>());
    });
  }
}
