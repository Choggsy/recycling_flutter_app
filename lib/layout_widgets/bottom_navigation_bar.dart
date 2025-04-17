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
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize;

    if (screenWidth < 600) {
      // Phone view
      iconSize = screenWidth * 0.08;
    } else {
      // Tablet view
      iconSize = screenWidth * 0.029;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            width: iconSize,
            height: iconSize,
            child: ImageIcon(AssetImage('assets/navigation/reuse.png')),
          ),
          label: 'Upcycle',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: iconSize,
            height: iconSize,
            child: ImageIcon(AssetImage('assets/navigation/home.png')),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: iconSize,
            height: iconSize,
            child: ImageIcon(AssetImage('assets/navigation/guidelines.png')),
          ),
          label: 'Guidelines',
        ),
      ],
    );
  }
}