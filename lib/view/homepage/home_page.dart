import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/component/tile_button.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart';
import 'package:recycling_flutter_app/view/homepage/bin_collection_page.dart';
import '../../helper/get_page.dart';
import 'map_page.dart';
import 'news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Page'),
              buildTileButton("Map Button", 0, (context) => MapPage()),
              const SizedBox(height: 20),
              buildTileButton("Sorting Guide", 1, (context) => RecyclableLogoPage()),
              buildTileButton("Bin Collection Days", 2, (context) => BinCollectionPage()),
              buildTileButton("Recycling Revolution Latest News", 3, (context) => NewsPage()),
            ],
          ),
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
