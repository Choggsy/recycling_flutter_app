import 'package:flutter/cupertino.dart' show Center, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold;
import 'package:flutter/widgets.dart' show Widget;

class FlexiblePlasticsPage extends StatelessWidget {
  const FlexiblePlasticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flexible Plastics')),
      body: Center(child: Text('This is the Flexible Plastics page')),
    );
  }
}