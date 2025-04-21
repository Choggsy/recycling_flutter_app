import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import '../helper/get_material_page.dart' show getMaterialPage;
import '../helper/get_page.dart';
import '../component/mosaic_buttons.dart' show MosaicButtons;

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: MosaicButtons.buildMosaicGrid(
          context,
          ['Cardboard', 'Glass', 'Plastic', 'Material 3', 'Material 4', 'Material 5', 'Material 6', 'Material 7', 'Material 8'],
          getMaterialPage,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
      ),
    );
  }
}
