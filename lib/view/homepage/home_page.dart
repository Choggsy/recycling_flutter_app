import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart';
import 'package:recycling_flutter_app/component/top_app_bar.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/bin_collection_page.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/news_page.dart';
import 'package:recycling_flutter_app/view/homepage/subpages/sustainable_page.dart';

import '../../component/fact_highlight_module.dart';
import '../../component/logo_button.dart';
import '../../helper/fact_parser.dart';
import '../../helper/get_material_page.dart';
import '../../helper/get_page.dart';
import '../../helper/space_helper.dart';
import '../../model/fact.dart';
import '../../properties/app_theme.dart';
import '../../properties/button_style.dart';
import '../../properties/device_view_vector.dart';
import 'subpages/involvement_page.dart';

typedef GetPageCallback = Widget Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  mapButton(context),
                  Space.medium.box,
                  buildDivider(2),
                  Space.small.box,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: LogoButton(
                      label: 'Logo Guide',
                      index: 9,
                      getPage: (context) => getMaterialPage(9),
                    ),
                  ),
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
                        assetPath: 'assets/home/bin_icon.png',
                        showLabel: false,
                      ),
                      ButtonStyles.iconTile(
                        context: context,
                        index: 3,
                        getPage: (index) => const SustainabilityPage(),
                        label: "Sustainability Page",
                        assetPath: 'assets/home/sustainability.png',
                        showLabel: false,
                      ),
                      ButtonStyles.wideIconTile(
                        context: context,
                        index: 4,
                        getPage: (index) => const InvolvementPage(),
                        label: "Involvement Page",
                        assetPath: 'assets/home/sprout.png',
                      ),
                    ],
                  ),
                  Space.large.box,
                  buildDivider(4),
                  RecyclingFactsSection(facts: snapshot.data!),
                  Space.large.box,
                  buildDivider(4),
                  Space.large.box,
                  ButtonStyles.tileContent(
                    context: context,
                    index: 5,
                    getPage: (index) => const NewsPage(),
                    label: "Recycling News",
                    assetPath: 'assets/home/news.png',
                    textPosition: 'left',
                  ),
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

  Center mapButton(BuildContext context) {
    final isTablet = ScreenConfig.getViewType(
        MediaQuery.of(context).size.width) == ViewType.tablet;
    final double size = isTablet ? 450 : 400;

    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBrown, width: 2),
            borderRadius: BorderRadius.zero,
            image: const DecorationImage(
              image: AssetImage('assets/home/map_screenshot.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Divider buildDivider(double thickness) {
    return Divider(thickness: thickness, color: AppColors.darkRedBrown);
  }
}