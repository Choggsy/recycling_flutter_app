import 'package:flutter/material.dart';
import '../model/fact.dart';
import 'fact_card.dart';
import '../view/homepage/fact_page.dart';

class RecyclingFactsSection extends StatelessWidget {
  final List<RecyclingFact> facts;

  const RecyclingFactsSection({super.key, required this.facts});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recycling Facts',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RecyclingFactPage(facts: facts)));
              },
              child: Text('See All'),
            ),
          ],
        ),
        ...facts.take(2).map((fact) => RecyclingFactCard(fact: fact)).toList(),
      ],
    );
  }
}
