import 'package:flutter/material.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';
import '../../../component/logo_card.dart';
import '../../../component/tile_button.dart' show TileButton;
import '../../../helper/get_logo_page.dart' show getLogoPage;
import '../../../properties/app_theme.dart' show AppColors;

class RecyclableLogoPage extends StatelessWidget {
  const RecyclableLogoPage({super.key});

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
                  label: 'Recyclable',
                  index: 0,
                  getPage: getLogoPage,
                  activeColor: AppColors.darkGreen,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Environment',
                  index: 1,
                  getPage: getLogoPage,
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
            child: ListView(
              children: [
                LogoCard(
                  imagePath: 'assets/logo/placeholder.jpg',
                  title: 'Logo 1',
                  description: 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec p',
                ),
                LogoCard(
                  imagePath: 'assets/logo/placeholder.jpg',
                  title: 'Logo 2',
                  description: 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec p',
                ),
                LogoCard(
                  imagePath: 'assets/logo/placeholder.jpg',
                  title: 'Logo 3',
                  description: 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec p',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
