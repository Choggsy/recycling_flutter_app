import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guidelines_page.dart';

import '../view/material/cardboard_page.dart' show CardboardPage;
import '../view/material/glass_page.dart' show GlassPage;
import '../view/material/plastic_page.dart' show PlasticPage;

Widget getMaterialPage(int index) {
  switch (index) {
    case 0:
      return CardboardPage();
    case 1:
      return GlassPage();
    case 2:
      return PlasticPage();
  // Add more cases for other buttons
    default:
      return GuidelinesPage();
  }
}
