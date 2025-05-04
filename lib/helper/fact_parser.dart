import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/fact.dart';

Future<List<RecyclingFact>> loadRecyclingFacts() async {
  final List<dynamic> jsonData = json.decode(await rootBundle.loadString('assets/facts.json'));
  return jsonData.map((item) => RecyclingFact.fromJson(item)).toList();
}
