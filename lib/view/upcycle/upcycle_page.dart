import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart'
    show CustomAppBar;
import 'package:recycling_flutter_app/component/mosaic_buttons.dart'
    show MosaicButtons;
import 'package:recycling_flutter_app/helper/space_helper.dart'
    show Space, SpaceExtension;
import '../../helper/get_page.dart' show getPage;
import '../../helper/upcycling_service.dart';
import '../../properties/device_view_vector.dart';
import 'tutorial_page.dart';

class UpcyclePage extends StatelessWidget {
  const UpcyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final restrictedWidth = 0.15;
    final smallIconSize = ScreenConfig.getIconSize(
      screenWidth,
    ); // Smaller size applied

    return Scaffold(
      appBar: CustomAppBar(title: 'Upcycling', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Space.medium.box,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth * restrictedWidth,
                      height: screenWidth * restrictedWidth,
                      child: IconButton(
                        icon: Image.asset('assets/upcycle/craft.png'),
                        iconSize: smallIconSize,
                        onPressed: () => print("Crafting button pressed"),
                      ),
                    ),
                    const Text("Crafting"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth * restrictedWidth,
                      height: screenWidth * restrictedWidth,
                      child: IconButton(
                        icon: Image.asset('assets/upcycle/garden.png'),
                        iconSize: smallIconSize,
                        onPressed: () => print("Utility button pressed"),
                      ),
                    ),
                    const Text("Utility"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth * restrictedWidth,
                      height: screenWidth * restrictedWidth,
                      child: IconButton(
                        icon: Image.asset('assets/upcycle/repurpose.png'),
                        iconSize: smallIconSize,
                        onPressed: () => print("Garden button pressed"),
                      ),
                    ),
                    const Text("Garden"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth * restrictedWidth,
                      height: screenWidth * restrictedWidth,
                      child: IconButton(
                        icon: Image.asset('assets/upcycle/utility.png'),
                        iconSize: smallIconSize,
                        onPressed: () => print("Repurpose button pressed"),
                      ),
                    ),
                    const Text("Repurpose"),
                  ],
                ),
              ],
            ),
            Space.medium.box,
            Text(
              'Upcycling Tutorials',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Space.medium.box,
            buildFutureBuilder(),
            Space.medium.box,
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
      ),
    );
  }

  FutureBuilder<List<MapEntry<String, int>>> buildFutureBuilder() {
    return FutureBuilder<List<MapEntry<String, int>>>(
      future: UpcyclingService.loadTutorialTitles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoading();
        } else if (snapshot.hasError) {
          return _buildError();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmpty();
        } else {
          return MosaicButtons.buildMosaicGrid(
            context,
            snapshot.data!,
            (index) => TutorialPage(tutorialTitle: snapshot.data![index].key),
          );
        }
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() => const Center(child: Text('Error loading tutorials'));

  Widget _buildEmpty() => const Center(child: Text('No tutorials available'));
}
