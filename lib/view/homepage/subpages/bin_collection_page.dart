import 'package:flutter/material.dart';
import '../../../component/logo_card.dart';
import '../../../helper/space_helper.dart';

class BinCollectionPage extends StatelessWidget {
  const BinCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bin Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children:  [
          Space.large.box,
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'Recycling Bin',
            description: 'Used for paper, cardboard, and plastics.'),
          Space.medium.box,
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'Organic Bin',
            description: 'Used for food waste and garden clippings.'),
          Space.medium.box,
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'General Waste Bin',
            description: 'Used for non-recyclable household waste.'),
          Space.large.box,
        ],
      ),
    );
  }
}
