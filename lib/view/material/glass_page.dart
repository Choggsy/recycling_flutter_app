import 'package:flutter/cupertino.dart' show Center, StatelessWidget, Text;
import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold;
import 'package:flutter/widgets.dart' show Widget;

class GlassPage extends StatelessWidget {
  const GlassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Glass')),
      body: Center(child: Text('This is the Glass page')),
    );
  }
}
