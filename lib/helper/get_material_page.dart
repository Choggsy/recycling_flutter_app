import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;

import '../view/guideline/material/material_page.dart';

Widget getMaterialPage(int index) {
  switch (index) {
    case 0:
      return MaterialPage(materialTitle: 'Cardboard');
    case 1:
      return MaterialPage(materialTitle: 'Glass');
    case 2:
      return MaterialPage(materialTitle: 'Aluminium');
    case 3:
      return MaterialPage(materialTitle: 'Plastic');
    case 4:
      return MaterialPage(materialTitle: 'Electronics');
    case 5:
      return MaterialPage(materialTitle: 'Food Waste');
    case 6:
      return MaterialPage(materialTitle: 'Metal');
    case 7:
      return MaterialPage(materialTitle: 'Textiles');
    case 8:
      return MaterialPage(materialTitle: 'Wood');
    case 9:
      return MaterialPage(materialTitle: 'Flexible Plastics');
    case 10:
      return RecyclableLogoPage();
    default:
      return GuidelinesPage();
  }
}
