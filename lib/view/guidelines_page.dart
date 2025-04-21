import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import '../helper/get_material_page.dart' show getMaterialPage;
import '../helper/get_page.dart';
import '../properties/app_theme.dart' show AppColors;
import '../component/mosaic_buttons.dart' show MosaicButtons;

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4, // Number of columns in the grid
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: MosaicButtons.buildMosaicButtons(
            context,
            ['Cardboard', 'Glass', 'Plastic', 'Material 3', 'Material 4'],
            getMaterialPage,
          ),
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
