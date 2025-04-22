import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;

import '../view/guideline/material/cardboard_page.dart' show CardboardPage;
import '../view/guideline/material/electionics_page.dart' show ElectronicsPage;
import '../view/guideline/material/flexible_plastics.page.dart' show FlexiblePlasticsPage;
import '../view/guideline/material/glass_page.dart' show GlassPage;
import '../view/guideline/material/plastic_page.dart' show PlasticPage;
import '../view/guideline/material/metal_page.dart' show MetalPage;
import '../view/guideline/material/textiles_page.dart' show TextilesPage;
import '../view/guideline/material/wood_page.dart' show WoodPage;
import '../view/guideline/material/food_waste_page.dart' show FoodWastePage;
import '../view/guideline/room_guide_page.dart' show RoomSelectionPage;

Widget getMaterialPage(int index) {
  switch (index) {
    case 0:
      return CardboardPage();
    case 1:
      return GlassPage();
    case 2:
      return PlasticPage();
    case 3:
      return ElectronicsPage();
    case 4:
      return FoodWastePage();
    case 5:
      return MetalPage();
    case 6:
      return TextilesPage();
    case 7:
      return WoodPage();
    case 8:
      return FlexiblePlasticsPage();
    case 9:
      return RoomSelectionPage();
    case 10:
      return RecyclableLogoPage();
    default:
      return GuidelinesPage();
  }
}
