import 'package:flutter/cupertino.dart' show Widget;

import '../view/logo_guide_page.dart' show LogoGuidePage;

Widget getLogoPage(int index) {
  switch (index) {
    case 0:
      return LogoGuidePage();
    case 1:
      // return SecondPage();
    case 2:
      // return ThirdPage();
    default:
      return LogoGuidePage(); // Default to LogoGuidePage if index is out of range
  }
}