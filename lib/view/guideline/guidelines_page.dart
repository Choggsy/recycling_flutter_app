import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/component/bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import 'package:recycling_flutter_app/component/top_app_bar.dart'
    show CustomAppBar;
import '../../component/logo_button.dart';
import '../../component/mosaic_buttons.dart' show MosaicButtons;
import '../../helper/get_material_page.dart' show getMaterialPage;
import '../../helper/get_page.dart';
import '../../helper/space_helper.dart' show Space, SpaceExtension;
import '../../properties/app_theme.dart';

class MaterialItem {
  final String title;
  final String description;
  final String image;
  final List<String> contaminators;

  MaterialItem({
    required this.title,
    required this.description,
    required this.image,
    required this.contaminators,
  });

  factory MaterialItem.fromJson(Map<String, dynamic> json) {
    return MaterialItem(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      contaminators: List<String>.from(json['contaminators']),
    );
  }
}

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  Future<List<MaterialItem>> loadMaterials(BuildContext context) async {
    final String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/materials.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((item) => MaterialItem.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines', showBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Space.medium.box,
            // Logo guide button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              child: LogoButton(
                label: 'Logo Guide',
                index: 9,
                getPage: (context) => getMaterialPage(9),
              ),
            ),
            Space.small.box,
            buildDivider(),
            Space.medium.box,
            Text(
              'Material Guidelines',
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium,
            ),
            Space.small.box,
            FutureBuilder<List<MaterialItem>>(
              future: loadMaterials(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No materials found.');
                }

                final materials = snapshot.data!;
                return MosaicButtons.buildMosaicGrid(
                  context,
                  materials
                      .asMap()
                      .entries
                      .map((entry) => MapEntry(entry.value.image, entry.key))
                      .toList(),
                  getMaterialPage,
                );
              },
            ),
            Space.medium.box,
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

  Divider buildDivider() {
    return Divider(thickness: 4, color: AppColors.darkRedBrown);
  }
}
