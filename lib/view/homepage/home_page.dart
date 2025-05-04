import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import 'package:recycling_flutter_app/view/homepage/bin_collection_page.dart';
import 'package:recycling_flutter_app/view/homepage/map_page.dart';
import 'package:recycling_flutter_app/view/homepage/news_page.dart';
import 'package:recycling_flutter_app/view/homepage/sustainable_page.dart';
import '../../component/fact_card.dart';
import '../../helper/get_page.dart';
import '../../helper/space_helper.dart';
import '../../model/fact.dart';
import '../../properties/app_theme.dart' show AppColors;
import '../../properties/button_style.dart';
import '../guideline/logo/recycling_logo_page.dart';
import 'fact_page.dart';
import 'involvement_page.dart';

typedef GetPageCallback = Widget Function(int index);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<RecyclingFact> facts = [
      RecyclingFact(
        id: 1,
        title: "Don't recycle anything smaller than a tennis ball",
        description: "Small items can jam the recycling machinery, causing delays and potential damage.",
      ),
      RecyclingFact(
        id: 2,
        title: "Rinse out containers before recycling",
        description: "Food residue can contaminate other recyclables, making them unsuitable for recycling.",
      ),
      RecyclingFact(
        id: 3,
        title: "Do not recycle plastic bags",
        description: "Plastic bags can get tangled in the machinery, causing operational issues.",
      ),
      RecyclingFact(
        id: 4,
        title: "Flatten cardboard boxes",
        description: "Flattening boxes saves space and makes the recycling process more efficient.",
      ),
    ];


    return Scaffold(
      appBar: CustomAppBar(title: 'Home', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDivider(2),
            Space.medium.box,
            ButtonStyles.buildTileButton("Map Button", 0, (index) => const MapPage(), context),
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
            // Text('Recycling Facts', style: Theme.of(context).textTheme.titleLarge),
            buildDivider(4),
            buildRecyclingFactsSection(context, facts),
            Space.large.box,
            buildDivider(4),
            Space.large.box,
            ButtonStyles.buildTileButton("Recycling News", 5, (index) => const NewsPage(), context)
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

  Divider buildDivider(final double thickness) {
    return Divider(
      thickness: thickness,
      color: AppColors.darkRedBrown,
    );
  }

  Widget buildRecyclingFactsSection(final BuildContext context, final List<RecyclingFact> facts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recycling Facts',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RecyclingFactPage(facts: facts)));
              },
              child: Text('See All'),
            ),
          ],
        ),
        ...facts.take(2).toList().map((fact) => RecyclingFactCard(fact: fact)).toList(),
      ],
    );
  }
}