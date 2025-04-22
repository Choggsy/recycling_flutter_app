import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart'
    show RecyclableLogoPage;

import '../view/guideline/material/cardboard_page.dart' show CardboardPage;
import '../view/guideline/material/glass_page.dart' show GlassPage;
import '../view/guideline/material/plastic_page.dart' show PlasticPage;
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
      return RecyclableLogoPage();
    case 9:
      return RoomSelectionPage();
    default:
      return GuidelinesPage();
  }
}
