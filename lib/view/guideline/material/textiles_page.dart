import 'package:flutter/cupertino.dart' show Center, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold;
import 'package:flutter/widgets.dart' show Widget;

class TextilesPage extends StatelessWidget {
  const TextilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Textiles')),
      body: Center(child: Text('This is the Textiles page')),
    );
  }
}
