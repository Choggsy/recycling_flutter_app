import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart';

import '../../../component/logo_button.dart';
import '../../../component/logo_card.dart';
import '../../../helper/get_logo_page.dart' show getLogoPage;
import '../../../properties/app_theme.dart' show AppColors;

class NonRegulatedLogoPage extends StatefulWidget {
  final Future<Map<String, dynamic>> Function()? loader;

  const NonRegulatedLogoPage({super.key, this.loader});

  @override
  _NonRegulatedLogoPageState createState() => _NonRegulatedLogoPageState();
}

class _NonRegulatedLogoPageState extends State<NonRegulatedLogoPage> {
  late Future<Map<String, dynamic>> logosData;

  Future<Map<String, dynamic>> loadLogos() async {
    final String response = await rootBundle.loadString('assets/logos.json');
    return json.decode(response);
  }

  @override
  void initState() {
    super.initState();
    logosData = widget.loader != null ? widget.loader!() : loadLogos();
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
                child: LogoButton(
                  label: 'Recyclable',
                  index: 0,
                  getPage: getLogoPage,
                ),
              ),
              Expanded(
                child: LogoButton(
                  label: 'Sustainable',
                  index: 1,
                  getPage: getLogoPage,
                ),
              ),
              Expanded(
                child: LogoButton(
                  label: 'Other Logos',
                  index: 2,
                  getPage: getLogoPage,
                  activeColor: AppColors.darkGreen,
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
                      ...logos['non_regulated']
                          .map<Widget>((logo) => LogoCard(
                        imageUrl: logo['imageUrl'],
                        title: logo['title'],
                        description: logo['description'],
                      ))
                          .toList(),
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
