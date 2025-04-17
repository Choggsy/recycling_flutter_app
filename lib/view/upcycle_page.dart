import 'package:flutter/material.dart';
import '../helper/get_page.dart' show getPage;
import '../layout_widgets/bottom_navigation_bar.dart';
import '../layout_widgets/top_app_bar.dart';

class UpcyclePage extends StatelessWidget {
  const UpcyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Reuse'),
      body: Center(
        child: Text('Reuse Page'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => getPage(index)),
          );
        },
      ),
    );
  }
}