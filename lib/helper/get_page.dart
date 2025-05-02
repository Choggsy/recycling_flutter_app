import 'package:flutter/cupertino.dart';

import '../view/guideline/guidelines_page.dart' show GuidelinesPage;
import '../view/homepage/home_page.dart' show HomePage;
import '../view/upcycle/upcycle_page.dart';

Widget getPage(final int index) {
  switch (index) {
    case 0:
      return const UpcyclePage();
    case 1:
      return const HomePage();
    case 2:
      return const GuidelinesPage();
    default:
      return const HomePage();
  }
}
