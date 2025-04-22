import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_material_page.dart' show getMaterialPage;
import 'package:recycling_flutter_app/view/guideline/material/cardboard_page.dart' show CardboardPage;
import 'package:recycling_flutter_app/view/guideline/material/glass_page.dart' show GlassPage;
import 'package:recycling_flutter_app/view/guideline/material/plastic_page.dart' show PlasticPage;
import 'package:recycling_flutter_app/view/guideline/material/electionics_page.dart' show ElectronicsPage;
import 'package:recycling_flutter_app/view/guideline/material/flexible_plastics.page.dart' show FlexiblePlasticsPage;
import 'package:recycling_flutter_app/view/guideline/material/metal_page.dart' show MetalPage;
import 'package:recycling_flutter_app/view/guideline/material/textiles_page.dart' show TextilesPage;
import 'package:recycling_flutter_app/view/guideline/material/wood_page.dart' show WoodPage;
import 'package:recycling_flutter_app/view/guideline/material/food_waste_page.dart' show FoodWastePage;
import 'package:recycling_flutter_app/view/guideline/room_guide_page.dart' show RoomSelectionPage;
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;
import 'package:recycling_flutter_app/view/guidelines_page.dart';

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

  test('getMaterialPage returns ElectronicsPage for index 3', () {
    expect(getMaterialPage(3), isA<ElectronicsPage>());
  });

  test('getMaterialPage returns FoodWastePage for index 4', () {
    expect(getMaterialPage(4), isA<FoodWastePage>());
  });

  test('getMaterialPage returns MetalPage for index 5', () {
    expect(getMaterialPage(5), isA<MetalPage>());
  });

  test('getMaterialPage returns TextilesPage for index 6', () {
    expect(getMaterialPage(6), isA<TextilesPage>());
  });

  test('getMaterialPage returns WoodPage for index 7', () {
    expect(getMaterialPage(7), isA<WoodPage>());
  });

  test('getMaterialPage returns FlexiblePlasticsPage for index 8', () {
    expect(getMaterialPage(8), isA<FlexiblePlasticsPage>());
  });

  test('getMaterialPage returns RoomSelectionPage for index 9', () {
    expect(getMaterialPage(9), isA<RoomSelectionPage>());
  });

  test('getMaterialPage returns RecyclableLogoPage for index 10', () {
    expect(getMaterialPage(10), isA<RecyclableLogoPage>());
  });

  for (var index in [11, 999, -1]) {
    test('getMaterialPage returns GuidelinesPage for outOfBounds index $index', () {
      expect(getMaterialPage(index), isA<GuidelinesPage>());
    });
  }
}
