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
          icon: ImageIcon(AssetImage('assets/navigation/reuse.png')),
          label: 'Upcycle',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/navigation/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/navigation/guidelines.png')),
          label: 'Guidelines',
        ),
      ],
    );
  }
}