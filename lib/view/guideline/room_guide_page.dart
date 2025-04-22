import 'package:flutter/material.dart';

class RoomSelectionPage extends StatelessWidget {
  const RoomSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Selection'),
      ),
      body: Center(
        child: Text('This is the Room Selection Page'),
      ),
    );
  }
}