import 'package:flutter/material.dart';
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns in the grid
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1, // Aspect ratio for square tiles
          ),
          itemCount: 6, // Number of buttons
          itemBuilder: (context, index) {
            return GridTile(
              child: Container(
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
                    // TODO: Navigate to different material pages make a getMaterial function like the getPage function
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
                  child: Text('Material $index'), // Replace with actual button labels
                ),
              ),
            );
          },
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
