import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        children: [
          Space.large.box,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Bournemouth',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
          Space.large.box,
          LogoCard(
            imageUrl: "https://cdn11.bigcommerce.com/s-ltuq993ifh/images/stencil/1280x1280/products/317/860/Green240__96555__54148.1695294398.jpg?c=2",
            title: 'Recycling Bin',
            description:
            'Used for paper, cardboard, and plastics.\n\n'
                '🗓️ Collected every other week.\n'
                '⏰ Place outside by 6:00 AM on collection day.',
          ),
          Space.medium.box,
          LogoCard(
            imageUrl: "https://www.nelincs.gov.uk/assets/uploads/2024/02/brown-bin-1.png",
            title: 'Organic Bin',
            description:
            'Used for food waste and garden clippings.\n\n'
                '🗓️ Collected every other week (alternates with Recycling).\n'
                '⏰ Place outside by 6:00 AM on collection day.',
          ),
          Space.medium.box,
          LogoCard(
            imageUrl: "https://media.nisbets.com/asset/core/prodimage/large_new/gh868_wheelie-bin-black.jpg",
            title: 'General Waste Bin',
            description:
            'Used for non-recyclable household waste.\n\n'
                '🗓️ Collected weekly.\n'
                '⏰ Place outside by 6:00 AM on collection day.',
          ),
          Space.large.box,
          Center(
            child: GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://www.bcpcouncil.gov.uk/bins-waste-and-recycling/check-your-bin-day'));
              },
              child: const Text(
                'Visit BCP Council Bin Collection Site',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Space.large.box,

        ],
      ),
    );
  }
}