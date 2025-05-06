import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart'
    show CustomAppBar;
import 'package:recycling_flutter_app/component/mosaic_buttons.dart'
    show MosaicButtons;
import 'package:recycling_flutter_app/helper/space_helper.dart'
    show Space, SpaceExtension;
import 'package:recycling_flutter_app/properties/app_theme.dart';
import '../../helper/get_page.dart' show getPage;
import '../../helper/upcycling_service.dart';
import '../../properties/device_view_vector.dart';
import 'tutorial_page.dart';

class UpcyclePage extends StatefulWidget {
  const UpcyclePage({super.key});

  @override
  State<UpcyclePage> createState() => _UpcyclePageState();
}

class _UpcyclePageState extends State<UpcyclePage> {
  String selectedCategory = 'all';

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Upcycling', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Space.medium.box,
            _buildCategoryButtons(),
            Space.medium.box,
            Divider(thickness: 4, color: AppColors.darkRedBrown),
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

  Widget _buildCategoryButtons() {
    final screenWidth = MediaQuery.of(context).size.width;
    final restrictedWidth = 0.15;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _categoryButton('Craft', 'craft', screenWidth, restrictedWidth),
        _categoryButton('Utility', 'utility', screenWidth, restrictedWidth),
        _categoryButton('Garden', 'garden', screenWidth, restrictedWidth),
        _categoryButton('Repurpose', 'repurpose', screenWidth, restrictedWidth),
      ],
    );
  }

  Widget _categoryButton(
      final String label,
      final String category,
      final double screenWidth,
      final double restrictedWidth,
      ) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth * restrictedWidth,
          height: screenWidth * restrictedWidth,
          child: IconButton(
            icon: Image.asset('assets/upcycle/$category.png'),
            iconSize: ScreenConfig.getIconSize(screenWidth),
            onPressed: () {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
        ),
        Text(label),
      ],
    );
  }

  FutureBuilder<List<MapEntry<String, int>>> buildFutureBuilder() {
    return FutureBuilder<List<MapEntry<String, int>>>(
      future: UpcyclingService.loadTutorialImagesByCategory(selectedCategory),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoading();
        } else if (snapshot.hasError) {
          return _buildError();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmpty();
        } else {
          final entries = snapshot.data!;
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: UpcyclingService.loadAllTutorials(),
            builder: (context, tutorialSnapshot) {
              if (tutorialSnapshot.connectionState == ConnectionState.waiting) {
                return _buildLoading();
              } else if (tutorialSnapshot.hasError || !tutorialSnapshot.hasData) {
                return _buildError();
              }

              final tutorials = tutorialSnapshot.data!;
              return MosaicButtons.buildMosaicGrid(
                context,
                entries,
                    (index) => TutorialPage(tutorialTitle: tutorials[index]['title']),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget _buildError() => const Center(child: Text('Error loading tutorials'));
  Widget _buildEmpty() => const Center(child: Text('No tutorials available'));
}