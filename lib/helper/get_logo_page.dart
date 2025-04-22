import 'package:flutter/cupertino.dart' show Widget;

import '../view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;

Widget getLogoPage(int index) {
  switch (index) {
    case 0:
      return RecyclableLogoPage();
    case 1:
      // return SecondPage();
    case 2:
      // return ThirdPage();
    default:
      return RecyclableLogoPage(); // Default to LogoGuidePage if index is out of range
  }
}