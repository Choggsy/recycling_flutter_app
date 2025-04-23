import 'package:flutter/cupertino.dart' show Center, ConnectionState, FutureBuilder, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, CircularProgressIndicator, ListView, Scaffold;
import 'package:flutter/widgets.dart' show Widget;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../component/material_card.dart';

class MaterialPage extends StatelessWidget {
  final String materialTitle;

  const MaterialPage({super.key, required this.materialTitle});

  Future<Map<String, dynamic>> loadMaterial() async {
    final String response = await rootBundle.loadString('assets/materials.json');
    final List<Map<String, dynamic>> materials = List<Map<String, dynamic>>.from(json.decode(response));
    return materials.firstWhere((material) => material['title'] == materialTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(materialTitle)),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadMaterial(),
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
