import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';
import '../../../component/logo_card.dart';
import '../../../component/tile_button.dart' show TileButton;
import '../../../helper/get_logo_page.dart' show getLogoPage;
import '../../../properties/app_theme.dart' show AppColors;

class FairTradeEnvironmentalLogoPage extends StatefulWidget {
  const FairTradeEnvironmentalLogoPage({super.key});

  @override
  _FairTradeEnvironmentalLogoPageState createState() =>
      _FairTradeEnvironmentalLogoPageState();
}

class _FairTradeEnvironmentalLogoPageState
    extends State<FairTradeEnvironmentalLogoPage> {
  late Future<Map<String, dynamic>> logosData;

  Future<Map<String, dynamic>> loadLogos() async {
    final String response = await rootBundle.loadString('assets/logos.json');
    return json.decode(response);
  }

  @override
  void initState() {
    super.initState();
    logosData = loadLogos();
  }

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
                  label: 'Sustainable',
                  index: 1,
                  getPage: getLogoPage,
                  activeColor: AppColors.darkGreen,
                ),
              ),
              Expanded(
                child: TileButton(
                  label: 'Other Logos',
                  index: 2,
                  getPage: getLogoPage,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: logosData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading logos'));
                } else {
                  final logos = snapshot.data!;
                  return ListView(
                    children: [
                      ...logos['sustainable'].map((logo) => LogoCard(
                        imageUrl: logo['imageUrl'],
                        title: logo['title'],
                        description: logo['description'],
                      )).toList(),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}