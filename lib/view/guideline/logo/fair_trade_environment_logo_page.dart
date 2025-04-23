import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycling_flutter_app/view/guidelines_page.dart';
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
                  label: 'Environment',
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
                      ...logos['recyclable'].map((logo) =>
                          LogoCard(
                            imagePath: logo['imagePath'],
                            title: logo['title'],
                            description: logo['description'],
                          )).toList(),
                      ...logos['environment'].map((logo) =>
                          LogoCard(
                            imagePath: logo['imagePath'],
                            title: logo['title'],
                            description: logo['description'],
                          )).toList(),
                      ...logos['non_regulated'].map((logo) =>
                          LogoCard(
                            imagePath: logo['imagePath'],
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