import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import '../helper/get_material_page.dart' show getMaterialPage;
import '../helper/get_page.dart';
import '../component/mosaic_buttons.dart' show MosaicButtons;
import '../helper/space_helper.dart' show Space, SpaceExtension;

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Space.medium.box,
            SizedBox(
              width: double.infinity, // Make the button as wide as the parent
              child: TileButton(
                label: "logo guide",
                index: 0, // Adjust the index as needed
                getPage: getMaterialPage,
              ),
            ),
            Space.large.box,
            Text('Material Guidelines'),
            Space.small.box,
            MosaicButtons.buildMosaicGrid(
              context,
              ['Cardboard', 'Glass', 'Plastic', 'Material 3', 'Material 4', 'Material 5', 'Material 6', 'Material 7', 'Material 8'],
              getMaterialPage,
            ),
          ],
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