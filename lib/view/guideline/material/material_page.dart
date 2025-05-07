import 'package:flutter/cupertino.dart' show AsyncSnapshot, Center, Column, ConnectionState, FutureBuilder, Padding, SizedBox, StatelessWidget, Text, Widget;
import 'package:flutter/material.dart' show AppBar, BuildContext, CircularProgressIndicator, ListView, Scaffold;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../../component/material_card.dart';

class MaterialPage extends StatelessWidget {
  final String materialTitle;

  const MaterialPage({super.key, required this.materialTitle});

  Future<Map<String, dynamic>> _loadMaterial() async {
    final String response = await rootBundle.loadString('assets/materials.json');
    final List<Map<String, dynamic>> materials = List<Map<String, dynamic>>.from(json.decode(response));
    return materials.firstWhere((material) => material['title'] == materialTitle);
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoading();
    } else if (snapshot.hasError) {
      return _buildError();
    } else if (!snapshot.hasData) {
      return _buildEmpty();
    } else {
      return _buildMaterialList(snapshot.data!);
    }
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() => const Center(child: Text('Error loading material'));

  Widget _buildEmpty() => const Center(child: Text('No material available'));

  Widget _buildMaterialList(final Map<String, dynamic> material) {
    final List<String> instructions = List<String>.from(material['instructions'] ?? []);

    return ListView(
      children: [
        MaterialCard(
          imagePath: material['image'],
          title: material['title'],
          description: material['description'],
          contaminators: List<String>.from(material['contaminators']),
        ),
        if (instructions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Instructions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...instructions.map((step) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text('• $step'),
                )),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(materialTitle)),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadMaterial(),
        builder: (context, snapshot) => _buildBody(context, snapshot),
      ),
    );
  }
}