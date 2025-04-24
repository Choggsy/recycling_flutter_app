import 'dart:convert';

import 'package:flutter/services.dart';

class UpcyclingService {
  static Future<List<MapEntry<String, int>>> loadTutorialTitlesByCategory(final String category) async {

    return List<Map<String, dynamic>>
        .from(jsonDecode(await rootBundle.loadString('assets/upcycling.json'))['upcycling_tutorials'])
        .where((tutorial) => category == 'all' || tutorial['categories'].contains(category))
        .toList()
        .asMap()
        .entries
        .map((entry) => MapEntry(entry.value['title'] as String, entry.key))
        .toList();
  }
}