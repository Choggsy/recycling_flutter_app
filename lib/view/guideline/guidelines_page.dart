import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/tile_button.dart' show TileButton, GetPageCallback;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import '../../helper/get_material_page.dart' show getMaterialPage;
import '../../helper/get_page.dart';
import '../../component/mosaic_buttons.dart' show MosaicButtons;
import '../../helper/space_helper.dart' show Space, SpaceExtension;
import '../../properties/app_theme.dart';
import '../../properties/button_style.dart';

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
            ButtonStyles.buildTileButton("logo guide", 10, getMaterialPage,context),
            Space.small.box,
            Divider(
                thickness: 4,
                color: AppColors.darkRedBrown
            ),
            Space.medium.box,
            Text(
              'Material Guidelines',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Space.small.box,
            MosaicButtons.buildMosaicGrid(
              context,
              [
                MapEntry('Cardboard', 0),
                MapEntry('Glass', 1),
                MapEntry('Plastic', 2),
                MapEntry('Electronics', 3),
                MapEntry('Food Waste', 4),
                MapEntry('Metal', 5),
                MapEntry('Textiles', 6),
                MapEntry('Wood', 7),
                MapEntry('Flexible Plastic', 8),
              ],
              getMaterialPage,
            ),
            Space.medium.box,
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
