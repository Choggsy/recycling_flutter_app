import 'package:flutter/material.dart';

import '../helper/get_page.dart';
import '../layout_widgets/bottom_navigation_bar.dart';
import '../layout_widgets/top_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
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

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guidelines'),
      body: Center(
        child: Text('Guidelines Page'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
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

class ReusePage extends StatelessWidget {
  const ReusePage({super.key});

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