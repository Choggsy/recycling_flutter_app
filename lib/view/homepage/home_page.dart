import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/view/homepage/bin_collection_page.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';
import 'package:recycling_flutter_app/view/homepage/news_page.dart';
import 'package:recycling_flutter_app/view/homepage/sustainable_page.dart';
import '../../component/tile_button.dart';
import '../../helper/get_page.dart';
import '../../helper/space_helper.dart';
import '../../properties/app_theme.dart' show AppColors;
import '../guideline/logo/recycling_logo_page.dart';

typedef GetPageCallback = Widget Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
                thickness: 2,
                color: AppColors.darkRedBrown
            ),
            Space.medium.box,
            buildTileButton("Map Button", 0, (index) => const MapPage()),
            Space.medium.box,
            Divider(
                thickness: 2,
                color: AppColors.darkRedBrown
            ),
            Space.small.box,
            buildTileButton("Sorting Guide", 1, (index) => const RecyclableLogoPage()),
            Space.small.box,
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                buildIconTileButton(context, 2, (index) => const BinCollectionPage(), "Bin Collection Days", 'assets/logo/placeholder.jpg'),
                buildIconTileButton(context, 3, (index) => const NewsPage(), "Recycling News", 'assets/logo/placeholder.jpg'),
                buildWideIconTileButton(context, 4, (index) => const SustainabilityPage(), "Sustainability Page", 'assets/logo/placeholder.jpg'),
              ],
            ),
            Space.large.box,
            Divider(
                thickness: 4,
                color: AppColors.darkRedBrown
            ),
            Space.large.box,
            Divider(
                thickness: 4,
                color: AppColors.darkRedBrown
            ),
            Space.large.box,
            buildTileButton("Recycling News", 1, (index) => const NewsPage())
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
      ),
    );
  }

  Widget buildTileButton(String label, int index, GetPageCallback getPage) {
    return SizedBox(
      width: double.infinity,
      height: 110.0,
      child: TileButton(
        label: label,
        index: index,
        getPage: getPage,
      ),
    );
  }

  Widget buildIconTileButton(
      BuildContext context,
      int index,
      GetPageCallback getPage,
      String label,
      String assetPath,
      ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.darkBrown, width: 3.0),
            color: AppColors.background,
          ),
          child: Center(
            child: Semantics(
              label: label,
              child: Image.asset(
                assetPath,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWideIconTileButton(
      BuildContext context,
      int index,
      GetPageCallback getPage,
      String label,
      String assetPath,
      ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 4, // Full width
      mainAxisCellCount: 2,  // Taller height
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.darkBrown, width: 3.0),
            color: AppColors.background,
          ),
          child: Center(
            child: Semantics(
              label: label,
              child: Image.asset(
                assetPath,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}