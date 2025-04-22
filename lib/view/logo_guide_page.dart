import 'package:flutter/material.dart';
import '../component/tile_button.dart' show TileButton;
import '../helper/get_logo_page.dart' show getLogoPage;
import '../properties/app_theme.dart' show AppColors;

class LogoGuidePage extends StatelessWidget {
  const LogoGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo Guide'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TileButton(
                  label: 'Logo Guide',
                  index: 0,
                  getPage: getLogoPage,
                  activeColor: AppColors.darkGreen,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Second Page',
                  index: 1,
                  getPage: getLogoPage,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Third Page',
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