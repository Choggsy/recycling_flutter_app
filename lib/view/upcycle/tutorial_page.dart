import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../component/tutorial_card.dart';

class TutorialPage extends StatelessWidget {
  final String tutorialTitle;
  final Future<Map<String, dynamic>> Function()? tutorialLoader;

  const TutorialPage({
    super.key,
    required this.tutorialTitle,
    this.tutorialLoader, // Optional parameter for context testing
  });

  Future<Map<String, dynamic>> _defaultLoadTutorial() async {
    return List<Map<String, dynamic>>.from(jsonDecode(await rootBundle.loadString('assets/upcycling.json'))['upcycling_tutorials']).firstWhere(
          (tutorial) => tutorial['title'] == tutorialTitle,
      orElse: () => {
        'photo': '',
        'title': 'Unknown Tutorial',
        'description': 'No description available.',
        'supplies': [],
        'instructions': [],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tutorialTitle)),
      body: FutureBuilder<Map<String, dynamic>>(
        future: tutorialLoader?.call() ?? _defaultLoadTutorial(),
        builder: (context, snapshot) => _buildBody(context, snapshot),
      ),
    );
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