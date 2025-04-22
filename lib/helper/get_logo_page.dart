import 'package:flutter/cupertino.dart' show Widget;
import 'package:recycling_flutter_app/view/guideline/logo/non_regulate_logo_page.dart';

import '../view/guideline/logo/fair_trade_environment_logo_page.dart' show FairTradeEnvironmentalLogoPage;
import '../view/guideline/logo/recycling_logo_page.dart' show RecyclableLogoPage;

Widget getLogoPage(int index) {
  switch (index) {
    case 0:
      return RecyclableLogoPage();
    case 1:
      return FairTradeEnvironmentalLogoPage();
    case 2:
      return NonRegulatedLogoPage();
    default:
      return RecyclableLogoPage(); // Default to LogoGuidePage if index is out of range
  }
}