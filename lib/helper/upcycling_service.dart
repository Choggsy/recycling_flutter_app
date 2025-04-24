import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class UpcyclingService {
  static Future<List<MapEntry<String, int>>> loadTutorialTitles() async {
    final String response = await rootBundle.loadString('assets/upcycling.json');
    final Map<String, dynamic> data = jsonDecode(response);

    // Extracting and typing the data correctly
    final List<Map<String, dynamic>> tutorials = List<Map<String, dynamic>>.from(data['upcycling_tutorials']);
    return tutorials.asMap().entries.map((entry) => MapEntry(entry.value['title'] as String, entry.key)).toList();
  }
}