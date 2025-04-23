import 'package:flutter/cupertino.dart' show Center, ConnectionState, FutureBuilder, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, CircularProgressIndicator, ListView, Scaffold;
import 'package:flutter/widgets.dart' show Widget;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../../component/material_card.dart';

class CardboardPage extends StatelessWidget {
  const CardboardPage({super.key});

  Future<Map<String, dynamic>> loadMaterials() async {
    final String response = await rootBundle.loadString('assets/materials.json');
    final List<Map<String, dynamic>> materials = List<Map<String, dynamic>>.from(json.decode(response));
    return materials.firstWhere((material) => material['title'] == 'Cardboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cardboard')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadMaterials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading material'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No material available'));
          } else {
            final material = snapshot.data!;
            return ListView(
              children: [
                MaterialCard(
                  imagePath: material['image'],
                  title: material['title'],
                  description: material['description'],
                  contaminators: List<String>.from(material['contaminators']),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
