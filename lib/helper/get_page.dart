import 'package:flutter/cupertino.dart';

import '../view/home_page.dart';
import '../view/upcycle_page.dart';

Widget getPage(int index) {
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
