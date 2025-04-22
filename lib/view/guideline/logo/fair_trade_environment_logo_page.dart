import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import '../../../component/tile_button.dart' show TileButton;
import '../../../helper/get_logo_page.dart' show getLogoPage;
import '../../../properties/app_theme.dart' show AppColors;

class FairTradeEnvironmentalLogoPage extends StatelessWidget {
  const FairTradeEnvironmentalLogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logos Guide'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuidelinesPage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TileButton(
                  label: 'Recyclable Logos',
                  index: 0,
                  getPage: getLogoPage,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Fair trade and Environmental',
                  index: 1,
                  getPage: getLogoPage,
                  activeColor: AppColors.darkGreen,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Non Regulated',
                  index: 2,
                  getPage: getLogoPage,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text('This is the Logo Guide Page'),
            ),
          ),
        ],
      ),
    );
  }
}
