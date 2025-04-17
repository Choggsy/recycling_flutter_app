import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search), //TODO : This will change to Upcycling after tutorial
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), //TODO : This will change to Guidelines after tutorial
          label: 'Profile',
        ),
      ],
    );
  }
}