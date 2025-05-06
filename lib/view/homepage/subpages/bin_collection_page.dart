import 'package:flutter/material.dart';
import '../../../component/logo_card.dart';
import '../../../helper/space_helper.dart';

class BinCollectionPage extends StatelessWidget {
  const BinCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageUrlPlaceholder = 'https://images.unsplash.com/photo-1587334274328-64186a80aeee?q=80&w=2081&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
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
        children: [
          Space.large.box,
          LogoCard(
            imageUrl: imageUrlPlaceholder,
            title: 'Recycling Bin',
            description: 'Used for paper, cardboard, and plastics.',
          ),
          Space.medium.box,
          LogoCard(
            imageUrl: imageUrlPlaceholder,
            title: 'Organic Bin',
            description: 'Used for food waste and garden clippings.',
          ),
          Space.medium.box,
          LogoCard(
            imageUrl: imageUrlPlaceholder,
            title: 'General Waste Bin',
            description: 'Used for non-recyclable household waste.',
          ),
          Space.large.box,
        ],
      ),
    );
  }
}
