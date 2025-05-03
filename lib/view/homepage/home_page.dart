import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart';
import 'package:recycling_flutter_app/view/homepage/bin_collection_page.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';
import 'package:recycling_flutter_app/view/homepage/news_page.dart';
import '../../component/tile_button.dart';
import '../../helper/get_page.dart';
import '../../properties/app_theme.dart' show AppColors;

typedef GetPageCallback = Widget Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildTileButton("Map Button", 0, (index) => const MapPage()),
            const SizedBox(height: 20),
            Expanded(
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  buildTextTile("Sorting Guide"),
                  buildIconTileButton(context, 2, (index) => const BinCollectionPage(), "Bin Collection Days", 'assets/logo/placeholder.jpg'),
                  buildIconTileButton(context, 3, (index) => const NewsPage(), "Recycling News", 'assets/logo/placeholder.jpg'),
                ],
              ),
            ),
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

  Widget buildTextTile(String label) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.background,
          border: Border.all(color: AppColors.darkBrown, width: 3.0),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
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
}