import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart' show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart' show CustomAppBar;
import '../helper/get_page.dart';
import '../properties/app_theme.dart' show AppColors;

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4, // Number of columns in the grid
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: buildButton(context, 'Cardboard', 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: buildButton(context, 'Glass', 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buildButton(context, 'Plastic', 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: buildButton(context, 'Material 3', 3),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: buildButton(context, 'Material 4', 4),
            ),
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

  Widget buildButton(BuildContext context, String label, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBrown, width: 3.0), // Thick border
        color: AppColors.background, // Use theme color
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.darkBrown, backgroundColor: AppColors.background, // Text color from theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        onPressed: () {
          // Navigate to different material pages
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              // Replace with actual pages
              if (index == 0) return PlaceholderPage('Cardboard');
              if (index == 1) return PlaceholderPage('Glass');
              if (index == 2) return PlaceholderPage('Plastic');
              // Add more conditions for other buttons
              return PlaceholderPage('Material $index');
            }),
          );
        },
        child: Text(label), // Replace with actual button labels
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String material;
  const PlaceholderPage(this.material, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(material)),
      body: Center(child: Text('This is the $material page')),
    );
  }
}