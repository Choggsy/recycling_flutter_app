import 'package:flutter/material.dart';
import '../../../component/logo_card.dart';

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
        children: const [
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'Recycling Bin',
            description: 'Used for paper, cardboard, and plastics.'),
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'Organic Bin',
            description: 'Used for food waste and garden clippings.'),
          LogoCard(
            imagePath: 'assets/logo/placeholder.jpg',
            title: 'General Waste Bin',
            description: 'Used for non-recyclable household waste.')
        ],
      ),
    );
  }
}
