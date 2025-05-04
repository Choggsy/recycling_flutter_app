import 'package:flutter/material.dart';

import '../../component/fact_card.dart';
import '../../model/fact.dart';

class RecyclingFactPage extends StatelessWidget {
  final List<RecyclingFact> facts;

  const RecyclingFactPage({super.key, required this.facts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Recycling Facts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: facts.length,
        itemBuilder: (context, index) => RecyclingFactCard(fact: facts[index]),
      ),
    );
  }
}
