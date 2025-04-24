import 'package:flutter/cupertino.dart' show AsyncSnapshot, Center, ConnectionState, FutureBuilder, StatelessWidget, Text, Widget;
import 'package:flutter/material.dart' show AppBar, BuildContext, CircularProgressIndicator, ListView, Scaffold;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../component/tutorial_card.dart';

class TutorialPage extends StatelessWidget {
  final String tutorialTitle;

  const TutorialPage({super.key, required this.tutorialTitle});

  Future<Map<String, dynamic>> _loadTutorial() async {
    final String response = await rootBundle.loadString('assets/upcycling.json');
    final Map<String, dynamic> data = jsonDecode(response);
    final List<Map<String, dynamic>> tutorials = List<Map<String, dynamic>>.from(data['upcycling_tutorials']);

    return tutorials.firstWhere(
          (tutorial) => tutorial['title'] == tutorialTitle,
      orElse: () => {
        'photo': '',
        'title': 'Unknown Tutorial',
        'description': 'No description available.',
        'supplies': [],
        'instructions': []
      },
    );
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoading();
    } else if (snapshot.hasError) {
      return _buildError();
    } else if (!snapshot.hasData || snapshot.data!['title'] == 'Unknown Tutorial') {
      return _buildEmpty();
    } else {
      return _buildTutorialList(snapshot.data!);
    }
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget _buildError() => const Center(child: Text('Error loading tutorial'));
  Widget _buildEmpty() => const Center(child: Text('No tutorial available'));

  Widget _buildTutorialList(final Map<String, dynamic> tutorial) {
    return ListView(
      children: [
        TutorialCard(
          imagePath: tutorial['photo'] ?? '',
          title: tutorial['title'] ?? 'Unknown Title',
          description: tutorial['description'] ?? 'No description available.',
          supplies: List<String>.from(tutorial['supplies'] ?? []),
          instructions: List<String>.from(tutorial['instructions'] ?? []),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tutorialTitle)),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadTutorial(),
        builder: (context, snapshot) => _buildBody(context, snapshot),
      ),
    );
  }
}