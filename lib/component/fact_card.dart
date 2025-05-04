import 'package:flutter/material.dart';

import '../model/fact.dart';

class RecyclingFactCard extends StatelessWidget {
  final RecyclingFact fact;

  const RecyclingFactCard({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.recycling, color: Colors.green),
        title: Text(
          fact.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          fact.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

}
