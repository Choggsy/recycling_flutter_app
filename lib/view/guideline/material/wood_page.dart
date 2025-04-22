import 'package:flutter/cupertino.dart' show Center, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold;
import 'package:flutter/widgets.dart' show Widget;

class WoodPage extends StatelessWidget {
  const WoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wood')),
      body: Center(child: Text('This is the Wood page')),
    );
  }
}
