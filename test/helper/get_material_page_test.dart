import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/material/material_page.dart' as recycling_app;

void main() {
  test('getMaterialPage returns MaterialPage for index 0 with title Cardboard', () {
    final page = getMaterialPage(0);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Cardboard');
  });

  test('getMaterialPage returns MaterialPage for index 1 with title Glass', () {
    final page = getMaterialPage(1);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Glass');
  });

  test('getMaterialPage returns MaterialPage for index 2 with title Plastic', () {
    final page = getMaterialPage(2);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Plastic');
  });

  test('getMaterialPage returns MaterialPage for index 3 with title Electronics', () {
    final page = getMaterialPage(3);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Electronics');
  });

  test('getMaterialPage returns MaterialPage for index 4 with title Food Waste', () {
    final page = getMaterialPage(4);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Food Waste');
  });

  test('getMaterialPage returns MaterialPage for index 5 with title Metal', () {
    final page = getMaterialPage(5);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Metal');
  });

  test('getMaterialPage returns MaterialPage for index 6 with title Textiles', () {
    final page = getMaterialPage(6);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Textiles');
  });

  test('getMaterialPage returns MaterialPage for index 7 with title Wood', () {
    final page = getMaterialPage(7);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Wood');
  });

  test('getMaterialPage returns MaterialPage for index 8 with title Flexible Plastics', () {
    final page = getMaterialPage(8);
    expect(page, isA<recycling_app.MaterialPage>());
    expect((page as recycling_app.MaterialPage).materialTitle, 'Flexible Plastics');
  });

  test('getMaterialPage returns RecyclableLogoPage for index 9', () {
    expect(getMaterialPage(9), isA<RecyclableLogoPage>());
  });

  for (var index in [10, 999, -1]) {
    test('getMaterialPage returns GuidelinesPage for outOfBounds index $index', () {
      expect(getMaterialPage(index), isA<GuidelinesPage>());
    });
  }
}
