import 'dart:convert';
import 'package:flutter/services.dart';

class UpcyclingService {
  static Future<List<MapEntry<String, int>>> loadTutorialImagesByCategory(final String category) async {
    final List<Map<String, dynamic>> tutorials = List<Map<String, dynamic>>.from(
      jsonDecode(await rootBundle.loadString('assets/upcycling.json'))['upcycling_tutorials'],
    );

    final filtered = tutorials
        .asMap()
        .entries
        .where((entry) => category == 'all' || entry.value['categories'].contains(category))
        .map((entry) => MapEntry(entry.value['photo'] as String, entry.key))
        .toList();

    return filtered;
  }

  static Future<List<Map<String, dynamic>>> loadAllTutorials() async {
    return List<Map<String, dynamic>>.from(
      jsonDecode(await rootBundle.loadString('assets/upcycling.json'))['upcycling_tutorials'],
    );
  }
}