import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton, GetPageCallback;
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
            buildTileButton("logo guide", 3, getMaterialPage),
            Space.large.box,
            Text(
              'Material Guidelines',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Space.medium.box,
            MosaicButtons.buildMosaicGrid(
              context,
              ['Cardboard', 'Glass', 'Plastic', 'Material 3', 'Material 4', 'Material 5', 'Material 6', 'Material 7', 'Material 8'],
              getMaterialPage,
            ),
            Space.medium.box,
            buildTileButton("Room Selection", 4, getMaterialPage),
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

  Widget buildTileButton(final String label, final int index, final GetPageCallback getPage) {
    return SizedBox(
      width: double.infinity,
      height: 110.0, // Adjust the height as needed
      child: TileButton(
        label: label,
        index: index,
        getPage: getPage,
      ),
    );
  }
}
