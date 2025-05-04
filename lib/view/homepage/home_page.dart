import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/view/homepage/subpages/bin_collection_page.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/news_page.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/sustainable_page.dart';

import '../../component/fact_highlight_module.dart';
import '../../helper/fact_parser.dart';
import '../../helper/get_page.dart';
import '../../helper/space_helper.dart';
import '../../model/fact.dart';
import '../../properties/app_theme.dart' show AppColors;
import '../../properties/button_style.dart';
import '../guideline/logo/recycling_logo_page.dart';
import 'subpages/involvement_page.dart';

typedef GetPageCallback = Widget Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: FutureBuilder<List<RecyclingFact>>(
        future: loadRecyclingFacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading facts'));
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDivider(2),
                  Space.medium.box,
                  ButtonStyles.buildTileButton("Map Button", 0, (index) => MapPage(), context),
                  Space.medium.box,
                  buildDivider(2),
                  Space.small.box,
                  ButtonStyles.buildTileButton("Sorting Guide", 1, (index) => const RecyclableLogoPage(), context),
                  Space.small.box,
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      ButtonStyles.iconTile(
                        context: context,
                        index: 2,
                        getPage: (index) => const BinCollectionPage(),
                        label: "Bin Collection Days",
                        assetPath: 'assets/logo/placeholder.jpg',
                      ),
                      ButtonStyles.iconTile(
                        context: context,
                        index: 3,
                        getPage: (index) => const SustainabilityPage(),
                        label: "Sustainability Page",
                        assetPath: 'assets/logo/placeholder.jpg',
                      ),
                      ButtonStyles.wideIconTile(
                        context: context,
                        index: 4,
                        getPage: (index) => const InvolvementPage(),
                        label: "Involvement Page",
                        assetPath: 'assets/logo/placeholder.jpg',
                      ),
                    ],
                  ),
                  Space.large.box,
                  buildDivider(4),
                  RecyclingFactsSection(facts: snapshot.data!),
                  Space.large.box,
                  buildDivider(4),
                  Space.large.box,
                  ButtonStyles.buildTileButton("Recycling News", 5, (index) => const NewsPage(), context)
                ],
              ),
            );
          }
        },
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

  Divider buildDivider(final double thickness) {
    return Divider(
      thickness: thickness,
      color: AppColors.darkRedBrown,
    );
  }
}