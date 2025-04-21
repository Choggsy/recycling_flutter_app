import 'package:flutter/cupertino.dart' show Center, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold;
import 'package:flutter/widgets.dart' show Widget;

class PlasticPage extends StatelessWidget {
  const PlasticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plastic')),
      body: Center(child: Text('This is the Plastic page')),
    );
  }
}
