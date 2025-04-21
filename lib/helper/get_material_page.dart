import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import 'package:recycling_flutter_app/view/material/cardboard_page.dart' show CardboardPage;
import 'package:recycling_flutter_app/view/material/glass_page.dart' show GlassPage;
import 'package:recycling_flutter_app/view/material/plastic_page.dart' show PlasticPage;
import 'package:recycling_flutter_app/view/logo_guide_page.dart' show LogoGuidePage;

import '../view/room_guide_page.dart' show RoomSelectionPage;

Widget getMaterialPage(int index) {
  switch (index) {
    case 0:
      return CardboardPage();
    case 1:
      return GlassPage();
    case 2:
      return PlasticPage();
    case 3:
      return LogoGuidePage();
    case 4:
      return RoomSelectionPage();
    default:
      return GuidelinesPage();
  }
}
