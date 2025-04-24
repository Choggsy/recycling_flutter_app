import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../component/tutorial_card.dart';
import '../../model/tutorial.dart';

class TutorialPage extends StatelessWidget {
  final String tutorialTitle;
  final Future<Tutorial> Function()? tutorialLoader;

  const TutorialPage({
    super.key,
    required this.tutorialTitle,
    this.tutorialLoader, // Optional parameter for testing with custom loaders
  });

  Future<Tutorial> _defaultLoadTutorial() async {
    final tutorials = List<Map<String, dynamic>>.from(
      jsonDecode(await rootBundle.loadString('assets/upcycling.json'))['upcycling_tutorials'],
    );

    final tutorialData = tutorials.firstWhere(
          (tutorial) => tutorial['title'] == tutorialTitle,
      orElse: () => {
        'photo': '',
        'title': 'Unknown Tutorial',
        'description': 'No description available.',
        'supplies': [],
        'instructions': [],
        'categories': [],
      },
    );

    return Tutorial.fromJson(tutorialData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tutorialTitle)),
      body: FutureBuilder<Tutorial>(
        future: tutorialLoader?.call() ?? _defaultLoadTutorial(),
        builder: (context, snapshot) => _buildBody(context, snapshot),
      ),
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
Widget _buildError() => const Center(child: Text('Error loading tutorial'));
Widget _buildEmpty() => const Center(child: Text('No tutorial available'));

Widget _buildBody(BuildContext context, AsyncSnapshot<Tutorial> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return _buildLoading();
  } else if (snapshot.hasError) {
    return _buildError();
  } else if (!snapshot.hasData || snapshot.data!.title == 'Unknown Tutorial') {
    return _buildEmpty();
  } else {
    return _buildTutorialCard(snapshot.data!);
  }
}

Widget _buildTutorialCard(Tutorial tutorial) {
  return ListView(
    children: [
      TutorialCard(tutorial: tutorial),
    ],
  );
}