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
    double iconSize = MediaQuery.of(context).size.width * 0.08;
    // TODO: Could adjust this for accessibility with setting button

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Flexible(
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: ImageIcon(AssetImage('assets/navigation/reuse.png')),
            ),
          ),
          label: 'Upcycle',
        ),
        BottomNavigationBarItem(
          icon: Flexible(
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: ImageIcon(AssetImage('assets/navigation/home.png')),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Flexible(
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: ImageIcon(AssetImage('assets/navigation/guidelines.png')),
            ),
          ),
          label: 'Guidelines',
        ),
      ],
    );
  }
}
